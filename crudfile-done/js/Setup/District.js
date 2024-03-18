app.controller('DistrictListController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'District';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            District: 1,
        };

        $scope.searchData = {
            District: '',

        };

        $scope.perPage = {
            District: GlobalServices.getPerPageRow()
        };


        $scope.newDistrict = {
            DId: null,
            OrderNo: 0,     
            Code: '',
            DistrictName: '',
            ProvinceName: '',
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllDistrictListList();


    };

    $scope.ClearDistrict = function () {
        $scope.newDistrict = {
            DId: null,
            OrderNo: 0,
            Code: '',
            DistrictName: '',
            ProvinceName: '',
            Status: false,
           
            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
/*
    $scope.handleRadioButtonChange = function () {
        if ($scope.newDistrictList.Status === true) {
            $scope.newDistrictList.StatusLabel  = "सक्रिय"; // Set the label for active
        } else {
            $scope.newDistrictList.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
        }
    };
    $scope.handleRadioButtonChange();*/
    
    //Show hide jf for DistrictList

    function OnClickDefault() {



        /*  show or hide DistrictList*/

        document.getElementById('District-form').style.display = "none";

        document.getElementById('add-District-change').onclick = function () {
            document.getElementById('District-section').style.display = "none";
            document.getElementById('District-form').style.display = "block";
        }
        document.getElementById('back-to-list-District').onclick = function () {
            document.getElementById('District-form').style.display = "none";
            document.getElementById('District-section').style.display = "block";
        }


    };



    //************************* DistrictList *********************************
    $scope.IsValidDistrictList = function () {
        if ($scope.newDistrict.DistrictName.isEmpty()) {
            Swal.fire('Please ! Enter Department Name');
            return false;
        }
        return true;
    }
   
    $scope.SaveUpdateDistrictList = function () {
        if ($scope.IsValidDistrictList() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newDistrict.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateDistrictList();
                    }
                });
            } else
                $scope.CallSaveUpdateDistrictList();
        }
    };

    $scope.CallSaveUpdateDistrictList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveDistrictList",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newDistrict }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearDistrict();
                $scope.GetAllDistrictListList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllDistrictListList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.DistrictList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllDistrictList",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.DistrictList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getDistrictListById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            DId: refData.DId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getDistrictListById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newDistrict = res.data.Data;
                $scope.newDistrict.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('District-section').style.display = "none";
                document.getElementById('District-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelDistrictListById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected DistrictList :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { DId: refData.DId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteDistrictList",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllDistrictListList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});