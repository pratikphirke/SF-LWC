import {LightningElement,api,wire,track} from 'lwc';
import {loadScript} from 'lightning/platformResourceLoader';
import ChartJS from '@salesforce/resourceUrl/ChartJS';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getLeadByStatus from '@salesforce/apex/LeadGraphController.getLeadByStatus';
import { NavigationMixin } from 'lightning/navigation';
export default class ChartJsDemo extends NavigationMixin(LightningElement){

   
    @track dataSet;
    @wire(getLeadByStatus) wiredLeads(result) {
        if (result.data) {
            this.dataSet = result.data;

            console.log('RESULT DATA=>',result.data);
            this.Initializechartjs();
        } else if (result.error) {
            console.log('RESULT ERROR=>',result.error);
        }
    }
  
    @api chartjsInitialized = false;
    renderedCallback() {
        if (this.chartjsInitialized) {
            return;
        }
        this.chartjsInitialized = true;

        Promise.all([
                loadScript(this, ChartJS)
            ])
            .then(() => {
                this.Initializechartjs();
            })
            .catch(error => {
                console.log(error.message)
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error loading chartJs',
                        message: error.message,
                        variant: 'error'
                    })
                );
            });
    }

        Initializechartjs() {
            console.log("loaded");
            var piechart;
            var ctx = this.template.querySelector(".pie-chart").getContext('2d');

            piechart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: Object.keys(this.dataSet),
                    datasets: [{
                        label: 'count',
                        data: Object.values(this.dataSet),
                        backgroundColor: ["#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7FDBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"]

                    }]
                },
                options: {//this.graphClickEvent,
                    onClick: this.graphClickEvent(),
                    }
            });


            
        }
       
        graphClickEvent(){
            // evt.preventDefault();
            //  evt.stopPropagation();
            console.log('graphClickEvent-------------');
            debugger; 
        alert('Move to reports');
          /* this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Report',
                    actionName: 'home'
                },
            });*/
        }
          
           
    }

