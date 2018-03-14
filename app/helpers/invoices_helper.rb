module InvoicesHelper
	def last_invoice_id
		Invoice.last.present? ? Invoice.last.id : 0
	end

	def increment(attribute, by = 1)
		self[attribute] ||= 0
		self[attribute] += by
		self
	end

	def get_total_price(invoice)
		if invoice.invoice_items.present?
			price = 0
			invoice.invoice_items.each do |invoice_item|
				price += invoice_item.price
			end
		return price
		end
	end
    
	def get_amount_due(invoice)
		if invoice.invoice_items.present?
			price = 0
			invoice.invoice_items.each do |invoice_item|
				price += invoice_item.price
			end
		return price - invoice.discount + invoice.tax
		end
	end

end
