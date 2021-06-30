require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'Create' do
    context 'Allow create new records using CRUD patterns' do
      it 'creates a new bill in database' do

        bill = Bill.new(
            title: "PL 61/2021 - Projeto de Lei",
            summary: "Dispõe sobre implantação de Ecopontos de coleta de tampas plásticas e lacres de latas nos órgãos da Administração Municipal.",
            author: "Cristiano Coller",
            timestamp: "22 de Junho de 2021",
            localization: "Procuradoria-Geral - PROGER",
            status: "Permanência em tramitação",
            expiration_date: "",
            last_process_date: "24 de Junho de 2021",
            last_process_status: "Encaminhado à Procuradoria-Geral.",
            attachment_docs: 1,
            link: "https://sapl.camaranh.rs.gov.br/materia/73732",
            report_link: "/media/sapl/public/materialegislativa/2021/73732/pl_61-2021.odt"
        )
         
        bill.save

        expect(Bill.first.title).to eq 'PL 61/2021 - Projeto de Lei'
        expect(Bill.first.summary).to eq 'Dispõe sobre implantação de Ecopontos de coleta de tampas plásticas e lacres de latas nos órgãos da Administração Municipal.'
        expect(Bill.first.author).to eq 'Cristiano Coller'
        expect(Bill.first.timestamp).to eq "22 de Junho de 2021"
        expect(Bill.first.localization).to eq "Procuradoria-Geral - PROGER"
        expect(Bill.first.status).to eq "Permanência em tramitação"
        expect(Bill.first.expiration_date).to eq ""
        expect(Bill.first.last_process_date).to eq "24 de Junho de 2021"
        expect(Bill.first.last_process_status).to eq "Encaminhado à Procuradoria-Geral."
        expect(Bill.first.attachment_docs).to eq 1
        expect(Bill.first.link).to eq "https://sapl.camaranh.rs.gov.br/materia/73732"
        expect(Bill.first.report_link).to eq "/media/sapl/public/materialegislativa/2021/73732/pl_61-2021.odt"
      end
    end
  end
end

