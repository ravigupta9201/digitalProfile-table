app.controller('ResidenceElseWhereController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'ResidenceElseWhere';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            ResidenceElseWhere: 1,
        };

        $scope.searchData = {
            ResidenceElseWhere: '',

        };

        $scope.perPage = {
            ResidenceElseWhere: GlobalServices.getPerPageRow()
        };


        $scope.newResidenceElseWhere = {
            ResidenceElseWhereId: null,                
            OrderNo: 0,                             
            Code: '',                                
            MaritalStatusName: '',                   
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllResidenceElseWhereList();


    };

    $scope.ClearResidenceElseWhere = function () {
        $scope.newResidenceElseWhere = {
            ResidenceElseWhereId: null,
            OrderNo: 0,
            Code: '',
            MaritalStatusName: '',
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
    /*
        $scope.handleRadioButtonChange = function () {
            if ($scope.newResidenceElseWhere.Status === true) {
                $scope.newResidenceElseWhere.StatusLabel  = "सक्रिय"; // Set the label for active
            } else {
                $scope.newResidenceElseWhere.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
            }
        };
        $scope.handleRadioButtonChange();*/

    //Show hide jf for TollDetails

    function OnClickDefault() {



        /*  show or hide ResidenceElseWhere*/

        document.getElementById('ResidenceElseWhere-form').style.display = "none";

        document.getElementById('add-ResidenceElseWhere-change').onclick = function () {
            document.getElementById('ResidenceElseWhere-section').style.display = "none";
            document.getElementById('ResidenceElseWhere-form').style.display = "block";
        }
        document.getElementById('back-to-list-ResidenceElseWhere').onclick = function () {
            document.getElementById('ResidenceElseWhere-form').style.display = "none";
            document.getElementById('ResidenceElseWhere-section').style.display = "block";
        }


    };



    //************************* ResidenceElseWhere *********************************
    $scope.IsValidResidenceElseWhere = function () {
        if ($scope.newResidenceElseWhere.MaritalStatusName.isEmpty()) {
            Swal.fire('Please ! Enter MaritalStatusName Name');
            return false;
        }
        return true;
    }

    $scope.SaveUpdateResidenceElseWhere = function () {
        if ($scope.IsValidResidenceElseWhere() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newResidenceElseWhere.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateResidenceElseWhere();
                    }
                });
            } else
                $scope.CallSaveUpdateResidenceElseWhere();
        }
    };

    $scope.CallSaveUpdateResidenceElseWhere = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveResidenceElseWhere",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newResidenceElseWhere }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearResidenceElseWhere();
                $scope.GetAllResidenceElseWhereList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllResidenceElseWhereList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.ResidenceElseWhereList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllResidenceElseWhere",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.ResidenceElseWhereList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getResidenceElseWhereById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            ResidenceElseWhereId: refData.ResidenceElseWhereId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getResidenceElseWhereById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newResidenceElseWhere = res.data.Data;
                $scope.newResidenceElseWhere.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('ResidenceElseWhere-section').style.display = "none";
                document.getElementById('ResidenceElseWhere-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelResidenceElseWhereById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected ResidenceElseWhere :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { ResidenceElseWhereId: refData.ResidenceElseWhereId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteResidenceElseWhere",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllResidenceElseWhereList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});