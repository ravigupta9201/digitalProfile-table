app.controller('MarriedStatusController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'MarriedStatus';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            MarriedStatus: 1,
        };

        $scope.searchData = {
            MarriedStatus: '',

        };

        $scope.perPage = {
            MarriedStatus: GlobalServices.getPerPageRow()
        };


        $scope.newMarriedStatus = {
            MarriedStatusId: null,     
            OrderNo: 0,             
            Code: '',                
            MarriedStatusName: '',
            Status: false,


            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllMarriedStatusList();


    };

    $scope.ClearMarriedStatus = function () {
        $scope.newMarriedStatus = {
            MarriedStatusId: null,
            OrderNo: 0,
            Code: '',
            MarriedStatusName: '',
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
    /*
        $scope.handleRadioButtonChange = function () {
            if ($scope.newMarriedStatus.Status === true) {
                $scope.newMarriedStatus.StatusLabel  = "सक्रिय"; // Set the label for active
            } else {
                $scope.newMarriedStatus.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
            }
        };
        $scope.handleRadioButtonChange();*/

    //Show hide jf for TollDetails

    function OnClickDefault() {


        /*  show or hide MarriedStatus*/

        document.getElementById('MarriedStatus-form').style.display = "none";

        document.getElementById('add-MarriedStatus-change').onclick = function () {
            document.getElementById('MarriedStatus-section').style.display = "none";
            document.getElementById('MarriedStatus-form').style.display = "block";
        }
        document.getElementById('back-to-list-MarriedStatus').onclick = function () {
            document.getElementById('MarriedStatus-form').style.display = "none";
            document.getElementById('MarriedStatus-section').style.display = "block";
        }


    };



    //************************* MarriedStatus *********************************
    $scope.IsValidMarriedStatus = function () {
        if ($scope.newMarriedStatus.MarriedStatusName.isEmpty()) {
            Swal.fire('Please ! Enter MarriedStatus Name');
            return false;
        }
        return true;
    }

    $scope.SaveUpdateMarriedStatus = function () {
        if ($scope.IsValidMarriedStatus() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newMarriedStatus.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateMarriedStatus();
                    }
                });
            } else
                $scope.CallSaveUpdateMarriedStatus();
        }
    };

    $scope.CallSaveUpdateMarriedStatus = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveMarriedStatus",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newMarriedStatus }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearMarriedStatus();
                $scope.GetAllMarriedStatusList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllMarriedStatusList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.MarriedStatusList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllMarriedStatus",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.MarriedStatusList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getMarriedStatusById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            MarriedStatusId: refData.MarriedStatusId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getMarriedStatusById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newMarriedStatus = res.data.Data;
                $scope.newMarriedStatus.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('MarriedStatus-section').style.display = "none";
                document.getElementById('MarriedStatus-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelMarriedStatusById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected MarriedStatus :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { MarriedStatusId: refData.MarriedStatusId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteMarriedStatus",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllMarriedStatusList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});