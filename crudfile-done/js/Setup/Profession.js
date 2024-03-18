app.controller('ProfessionController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'Profession';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            Profession: 1,
        };

        $scope.searchData = {
            Profession: '',

        };

        $scope.perPage = {
            Profession: GlobalServices.getPerPageRow()
        };


        $scope.newProfession = {
            ProfessionId: null,        
            OrderNo: 0,             
            Code: '',                
            ProfessionName: '',      
            className: '',           
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllProfessionList();


    };

    $scope.ClearProfession = function () {
        $scope.newProfession = {
            ProfessionId: null,
            OrderNo: 0,
            Code: '',
            ProfessionName: '',
            className: '',
            Status: false,
            
            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
    /*
        $scope.handleRadioButtonChange = function () {
            if ($scope.newProfession.Status === true) {
                $scope.newProfession.StatusLabel  = "सक्रिय"; // Set the label for active
            } else {
                $scope.newProfession.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
            }
        };
        $scope.handleRadioButtonChange();*/

    //Show hide jf for TollDetails

    function OnClickDefault() {



        /*  show or hide Profession*/

        document.getElementById('Profession-form').style.display = "none";

        document.getElementById('add-Profession-change').onclick = function () {
            document.getElementById('Profession-section').style.display = "none";
            document.getElementById('Profession-form').style.display = "block";
        }
        document.getElementById('back-to-list-Profession').onclick = function () {
            document.getElementById('Profession-form').style.display = "none";
            document.getElementById('Profession-section').style.display = "block";
        }


    };



    //************************* Profession *********************************
    $scope.IsValidProfession = function () {
        if ($scope.newProfession.ProfessionName.isEmpty()) {
            Swal.fire('Please ! Enter ProfessionName Name');
            return false;
        }
        return true;
    }

    $scope.SaveUpdateProfession = function () {
        if ($scope.IsValidProfession() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newProfession.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateProfession();
                    }
                });
            } else
                $scope.CallSaveUpdateProfession();
        }
    };

    $scope.CallSaveUpdateProfession = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveProfession",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newProfession }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearProfession();
                $scope.GetAllProfessionList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllProfessionList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.ProfessionList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllProfession",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.ProfessionList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getProfessionById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            ProfessionId: refData.ProfessionId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getProfessionById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newProfession = res.data.Data;
                $scope.newProfession.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('Profession-section').style.display = "none";
                document.getElementById('Profession-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelProfessionById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected Profession :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { ProfessionId: refData.ProfessionId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteProfession",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllProfessionList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});