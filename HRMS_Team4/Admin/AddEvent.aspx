<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="HRMS_Team4.Admin.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet" />
    <style>
    #main-content {
    display: flex;
    gap: 20px;
    width: 100%;
}

#calendar {
    flex: 7;
    min-height: 700px;
}

#sidebar-container {
    flex: 3;
    min-height: 700px;
    position: relative;
}

#main-content::after {
    content: none;
}
        .btn-add-event-container {
    margin-bottom: 20px;
    text-align: center;
}
        .btn-add-event {
            background-color: #e8611a;
            color: white;
            font-size: 1.1rem;
            padding: 15px;
            width: 280px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .btn-add-event:hover { background-color: #cf540f; }
        .event-list { list-style: none; padding: 0; margin: 0; }
        .event-item {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .event-item h6 { margin: 0 0 8px 0; font-weight: bold; font-size: 1.1rem; }
        .event-item .event-date { color: #2eacb3; font-weight: bold; margin-bottom: 5px; }
        .event-item .event-description { margin: 8px 0 0; font-size: 0.9rem; color: #555; }
        .fc-event { color: white !important; }


        .modal-overlay {
            display: none;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.5);
            z-index: 9999;
            justify-content: center;
            align-items: center;
        }
        .modal-overlay.active { display: flex; }
        .modal-box {
            background: white;
            border-radius: 8px;
            padding: 30px;
            width: 500px;
            max-width: 95%;
            position: relative;
        }
        .modal-box h5 { font-size: 1.3rem; font-weight: bold; margin-bottom: 20px; }
        .modal-close {
            position: absolute;
            top: 15px; right: 20px;
            background: none; border: none;
            font-size: 1.5rem; cursor: pointer; color: #555;
        }
        .form-label { font-weight: 500; margin-bottom: 5px; display: block; }
        .form-control {
            width: 100%; padding: 8px 12px;
            border: 1px solid #ccc; border-radius: 5px;
            margin-bottom: 15px; font-size: 1rem; box-sizing: border-box;
        }
        .btn-save-event {
            background-color: #e8611a; color: white;
            border: none; padding: 10px 25px;
            border-radius: 5px; font-size: 1rem; cursor: pointer;
        }
        .btn-save-event:hover { background-color: #cf540f; }
        .alert-success-box {
            background: #d4edda; color: #155724;
            padding: 10px 15px; border-radius: 5px;
            margin-bottom: 15px; display: none;
        }
        .alert-error-box {
            background: #f8d7da; color: #721c24;
            padding: 10px 15px; border-radius: 5px;
            margin-bottom: 15px; display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager  ID="ScriptManager1"  runat="server"  EnablePageMethods="true"> </asp:ScriptManager>
   
     <asp:HiddenField ID="hfEventTypes" runat="server" />
        <asp:HiddenField ID="hfEvents"     runat="server" />

   
    <div id="main-content">
    <div id="calendar"></div>

     <div id="sidebar-container">
            <div class="btn-add-event-container">
               <button type="button"
        class="btn-add-event"
        onclick="openModal();">
    Add New Event
</button>
                   
            </div>
            <div id="event-sidebar">
                <ul class="event-list" id="eventList">
                   
                </ul>
            </div>
        </div>

    </div>

   
    <div class="modal-overlay" id="addEventModal">
        <div class="modal-box">
            <button class="modal-close" onclick="closeModal()">&times;</button>
            <h5>Add New Event</h5>

            <div class="alert-success-box" id="successMsg">✔ Event added successfully!</div>
            <div class="alert-error-box"   id="errorMsg">✖ Failed to add event. Try again.</div>

            <label class="form-label">Event Title</label>
            <input type="text" class="form-control" id="txtEventTitle" placeholder="Enter event title" />

            <label class="form-label">Event Date</label>
            <input type="date" class="form-control" id="txtEventDate" />

            <label class="form-label">Event Type</label>
            <select class="form-control" id="ddlEventType">
                <option value="">Select Event Type</option>
            </select>

           <button type="button"
        class="btn-save-event"
        onclick="saveEvent()">
    Add Event
</button>
        </div>
    </div>

   
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
    <script>
        var calendarInstance;

        document.addEventListener('DOMContentLoaded', function () {

           
            var rawTypes = document.getElementById('<%= hfEventTypes.ClientID %>').value;
            if (rawTypes) {
                var types = JSON.parse(rawTypes);
                var sel = document.getElementById('ddlEventType');
                types.forEach(function (t) {
                    var opt = document.createElement('option');
                    opt.value = t.Id;
                    opt.textContent = t.Name;
                    sel.appendChild(opt);
                });
            }

          
            var rawEvents = document.getElementById('<%= hfEvents.ClientID %>').value;
            var events = rawEvents ? JSON.parse(rawEvents) : [];

          
            renderEventList(events);

          
            var calendarEl = document.getElementById('calendar');
            calendarInstance = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left:   'prev,next today',
                    center: 'title',
                    right:  'dayGridMonth,timeGridWeek,timeGridDay'
                },
                events: events.map(function (e) {
                    return { title: e.Title, start: e.Date, color: e.Color || '#2eacb3' };
                }),
                eventClick: function (info) {
                    alert('Event: ' + info.event.title + '\nDate: ' + info.event.startStr);
                }
            });
            calendarInstance.render();
        });

       
        function renderEventList(events) {
            var ul = document.getElementById('eventList');
            ul.innerHTML = '';
            events.forEach(function (e) {
                ul.innerHTML +=
                    '<li class="event-item">'
                    + '<h6>' + e.Title + '</h6>'
                    + '<div class="event-date">' + e.Date + '</div>'
                    + '<div class="event-description">' + (e.Description || '') + '</div>'
                    + '</li>';
            });
        }

      
        function openModal()  { document.getElementById('addEventModal').classList.add('active'); }
        function closeModal() {
            document.getElementById('addEventModal').classList.remove('active');
            document.getElementById('txtEventTitle').value = '';
            document.getElementById('txtEventDate').value  = '';
            document.getElementById('ddlEventType').value  = '';
            document.getElementById('successMsg').style.display = 'none';
            document.getElementById('errorMsg').style.display   = 'none';
        }

       
        function saveEvent() {
            var title  = document.getElementById('txtEventTitle').value.trim();
            var date   = document.getElementById('txtEventDate').value;
            var typeId = document.getElementById('ddlEventType').value;

            if (!title || !date || !typeId) { alert('Please fill in all fields.'); return; }

            PageMethods.SaveEvent(title, date, typeId, onSaveSuccess, onSaveError);
        }

        function onSaveSuccess(result) {
            if (result === 'OK') {
                document.getElementById('successMsg').style.display = 'block';
                document.getElementById('errorMsg').style.display   = 'none';
                calendarInstance.addEvent({
                    title: document.getElementById('txtEventTitle').value,
                    start: document.getElementById('txtEventDate').value,
                    color: '#e8611a'
                });
                setTimeout(function () { location.reload(); }, 1200);
            } else {
                document.getElementById('errorMsg').style.display = 'block';
            }
        }
        function onSaveError() { document.getElementById('errorMsg').style.display = 'block'; }
    </script>

</asp:Content>
