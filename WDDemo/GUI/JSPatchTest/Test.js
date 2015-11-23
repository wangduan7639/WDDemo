defineClass('WDJSPatchTestViewController:WDBaseViewController<UIAlertViewDelegate>', {
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
    var tableViewCell = tableView.cellForRowAtIndexPath(indexPath);
    tableViewCell.selected = false;
    tableViewCell.highlighted = false;
    console.log('tableViewCell' + tableViewCell);
    console.log('selected' + tableViewCell.selected);

            
    var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.viewModel().dataArray().objectAtIndex(indexPath.row()), self, "OK", null);
    alertView.show()
    },
    alertView_willDismissWithButtonIndex: function(alertView, idx) {
    console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
    }
})
defineClass('WDTestViewController',{
    gotoJSPatchTest: function() {
    var viewModel = require('WDJSPatchTestViewModel').alloc().init();
    var controller = require('WDJSPatchTestViewController').alloc().initViewModel(viewModel);
    self.navigationController().pushViewController_animated(controller, YES)
    }
})