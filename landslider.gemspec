# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{landslider}
  s.version = "0.5.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Prall"]
  s.date = %q{2011-05-13}
  s.default_executable = %q{generate_api_key.rb}
  s.description = %q{Landslider is a ruby interface to the Landslide SOAP-based API}
  s.email = %q{jay@j4y.net}
  s.executables = ["generate_api_key.rb"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "HISTORY.md",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION.yml",
    "bin/generate_api_key.rb",
    "init.rb",
    "landslider.gemspec",
    "lib/landslider.rb",
    "lib/landslider/entities.rb",
    "lib/landslider/entities/ws_account.rb",
    "lib/landslider/entities/ws_account_note.rb",
    "lib/landslider/entities/ws_account_note_search.rb",
    "lib/landslider/entities/ws_address.rb",
    "lib/landslider/entities/ws_contact.rb",
    "lib/landslider/entities/ws_contact_note.rb",
    "lib/landslider/entities/ws_contact_note_search.rb",
    "lib/landslider/entities/ws_contact_search.rb",
    "lib/landslider/entities/ws_employee.rb",
    "lib/landslider/entities/ws_entity.rb",
    "lib/landslider/entities/ws_lead.rb",
    "lib/landslider/entities/ws_lead_contact.rb",
    "lib/landslider/entities/ws_lead_note.rb",
    "lib/landslider/entities/ws_lead_note_search.rb",
    "lib/landslider/entities/ws_lead_search.rb",
    "lib/landslider/entities/ws_my_list.rb",
    "lib/landslider/entities/ws_note.rb",
    "lib/landslider/entities/ws_opportunity.rb",
    "lib/landslider/entities/ws_opportunity_note.rb",
    "lib/landslider/entities/ws_opportunity_note_search.rb",
    "lib/landslider/entities/ws_opportunity_status.rb",
    "lib/landslider/entities/ws_payment_term.rb",
    "lib/landslider/entities/ws_pick_list_item.rb",
    "lib/landslider/entities/ws_primary_entity.rb",
    "lib/landslider/entities/ws_product.rb",
    "lib/landslider/entities/ws_product_family.rb",
    "lib/landslider/entities/ws_product_result.rb",
    "lib/landslider/entities/ws_record_upsert_result.rb",
    "lib/landslider/entities/ws_result.rb",
    "lib/landslider/entities/ws_search.rb",
    "lib/landslider/entities/ws_search_criterion.rb",
    "lib/landslider/entities/ws_search_operator.rb",
    "lib/landslider/entities/ws_selling_process.rb",
    "lib/landslider/entities/ws_user.rb",
    "lib/landslider/entities/ws_user_search.rb",
    "test/get_account_types_test.rb",
    "test/landslider_test.rb",
    "test/test_helper.rb",
    "test/ws_account_note_search_test.rb",
    "test/ws_contact_note_search_test.rb",
    "test/ws_lead_note_search_test.rb",
    "test/ws_opportunity_note_search_test.rb",
    "test/ws_search_test.rb"
  ]
  s.homepage = %q{https://github.com/j4y/landslider}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Landslide Ruby}
  s.test_files = [
    "test/get_account_types_test.rb",
    "test/landslider_test.rb",
    "test/test_helper.rb",
    "test/ws_account_note_search_test.rb",
    "test/ws_contact_note_search_test.rb",
    "test/ws_lead_note_search_test.rb",
    "test/ws_opportunity_note_search_test.rb",
    "test/ws_search_test.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<handsoap>, [">= 1.1.8"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<handsoap>, [">= 1.1.8"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<handsoap>, [">= 1.1.8"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

