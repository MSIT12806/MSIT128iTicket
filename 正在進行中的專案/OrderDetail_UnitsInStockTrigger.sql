create trigger OrderDetail_Insert on order_detail
for insert as
update tickets set UnitsInStock = (UnitsInStock-inserted.quantity)
from tickets join inserted on tickets.TicketID = inserted.TicketId
go
create trigger OrderDetail_Delete on order_detail
for delete as
update tickets set UnitsInStock = (UnitsInStock+deleted.quantity)
from tickets join deleted on tickets.ticketId = deleted.TicketId