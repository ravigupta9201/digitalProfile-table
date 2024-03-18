app.controller('VocationalTrainingOrSkillController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'VocationalTrainingOrSkill';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            VocationalTrainingOrSkill: 1,
        };

        $scope.searchData = {
            VocationalTrainingOrSkill: '',

        };

        $scope.perPage = {
            VocationalTrainingOrSkill: GlobalServices.getPerPageRow()
        };


        $scope.newVocationalTrainingOrSkill = {
            VocationalId: null,        
            OrderNo: 0,             
            Code: '',                
            TrainingSubjectName: '', 
            TrainingAreasName: '',   
            
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllVocationalTrainingOrSkillList();


    };

    $scope.ClearVocationalTrainingOrSkill = function () {
        $scope.newVocationalTrainingOrSkill = {
            VocationalId: null,
            OrderNo: 0,
            Code: '',
            TrainingSubjectName: '',
            TrainingAreasName: '',

            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
    /*
        $scope.handleRadioButtonChange = function () {
            if ($scope.newVocationalTrainingOrSkill.Status === true) {
                $scope.newVocationalTrainingOrSkill.StatusLabel  = "सक्रिय"; // Set the label for active
            } else {
                $scope.newVocationalTrainingOrSkill.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
            }
        };
        $scope.handleRadioButtonChange();*/

    //Show hide jf for TollDetails

    function OnClickDefault() {



        /*  show or hide VocationalTrainingOrSkill*/

        document.getElementById('VocationalTrainingOrSkill-form').style.display = "none";

        document.getElementById('add-VocationalTrainingOrSkill-change').onclick = function () {
            document.getElementById('VocationalTrainingOrSkill-section').style.display = "none";
            document.getElementById('VocationalTrainingOrSkill-form').style.display = "block";
        }
        document.getElementById('back-to-list-VocationalTrainingOrSkill').onclick = function () {
            document.getElementById('VocationalTrainingOrSkill-form').style.display = "none";
            document.getElementById('VocationalTrainingOrSkill-section').style.display = "block";
        }


    };



    //************************* VocationalTrainingOrSkill *********************************
    $scope.IsValidVocationalTrainingOrSkill = function () {
        if ($scope.newVocationalTrainingOrSkill.TrainingSubjectName.isEmpty()) {
            Swal.fire('Please ! Enter TrainingSubject Name');
            return false;
        }
        return true;
    }

    $scope.SaveUpdateVocationalTrainingOrSkill = function () {
        if ($scope.IsValidVocationalTrainingOrSkill() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newVocationalTrainingOrSkill.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateVocationalTrainingOrSkill();
                    }
                });
            } else
                $scope.CallSaveUpdateVocationalTrainingOrSkill();
        }
    };

    $scope.CallSaveUpdateVocationalTrainingOrSkill = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveVocationalTrainingOrSkill",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newVocationalTrainingOrSkill }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearVocationalTrainingOrSkill();
                $scope.GetAllVocationalTrainingOrSkillList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllVocationalTrainingOrSkillList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.VocationalTrainingOrSkillList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllVocationalTrainingOrSkill",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.VocationalTrainingOrSkillList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getVocationalTrainingOrSkillById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            VocationalId: refData.VocationalId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getVocationalTrainingOrSkillById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newVocationalTrainingOrSkill = res.data.Data;
                $scope.newVocationalTrainingOrSkill.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('VocationalTrainingOrSkill-section').style.display = "none";
                document.getElementById('VocationalTrainingOrSkill-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelVocationalTrainingOrSkillById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected VocationalTrainingOrSkill :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { VocationalId: refData.VocationalId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteVocationalTrainingOrSkill",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllVocationalTrainingOrSkillList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});