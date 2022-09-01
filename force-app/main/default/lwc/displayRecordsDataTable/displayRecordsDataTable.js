import { LightningElement, track } from 'lwc';
import getAccounts from'@salesforce/apex/AccountHelper.getAccounts';
const actions = [
    { label: 'Show details', name: 'show_details' },
    { label: 'Delete', name: 'delete' },
];
const columns = [
    { label: 'ID', fieldName: 'Id' ,sortable: true,},
    { label: 'Account Name', fieldName: 'Name', type: 'Text', editable: true ,sortable: true, },
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
   
];
export default class DisplayRecordsDataTable extends LightningElement {
  @track  data = [];
  @track  columns = columns;
    record = {};
    @track sortDirection = 'asc';
   
    connectedCallback() {

        getAccounts().then(result => {
            this.data = result;
         })
        .catch(error => {
          alert('Error: '+error.body.message);
        })
      
    }
    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'show_details':
                this.showRowDetails(row);
                break;
            default:
        }
    }

    deleteRow(row) {
        const { id } = row;
        const index = this.findRowIndexById(id);
        if (index !== -1) {
            this.data = this.data
                .slice(0, index)
                .concat(this.data.slice(index + 1));
        }
    }

    findRowIndexById(id) {
        let ret = -1;
        this.data.some((row, index) => {
            if (row.id === id) {
                ret = index;
                return true;
            }
            return false;
        });
        return ret;
    }

    showRowDetails(row) {
        this.record = row;
    }
     
}