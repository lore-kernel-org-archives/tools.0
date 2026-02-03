Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970C399029
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125484; cv=none; b=u+dS3psCtvWCAI4xhAUsVvI83nBKOXzxZDO1D0AlYaV6nfad+KxWpr7aOPc7EyAq25cqRqsbMiXYpPhFUfdWJUAAwSrVzzRlei3BmG2ZeqQXlVTRXwFnJmSoD9xVB7+ccXXQO03XjWC1BO6HNevvyIILKDoxup39WLBDr57u1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125484; c=relaxed/simple;
	bh=fphVL1SVYgpfHtBRBrP4KTpvG/s/fEHIHkeopBaMbw0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dkIKalDvFCBbtA7zNtbzEWYytWi6Q1GFOcSzVjtUDkbrsPsawvaJpubyzbfAm6dXJ0CvVCkwAbtUnRphyq3NowYP/AcMWzb9YjAZVFXZjiN7avxdIuD7P/IHAHX9FUkPyHzZL7LW6f6i7VSZ4sAvm89Jyb491bqzcOZi8fPNbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id BF3EEC2BCAF; Tue,  3 Feb 2026 13:31:23 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE154C116D0
	for <tools@kernel.org>; Tue,  3 Feb 2026 13:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE154C116D0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f54BR3xd7znWf;
	Tue,  3 Feb 2026 14:31:11 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f54BQ6rzdz8WP;
	Tue,  3 Feb 2026 14:31:10 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH b4 00/21] docs: various fixes + migration from definition
 lists to glossaries for config settings
Date: Tue, 03 Feb 2026 14:30:59 +0100
Message-Id: <20260203-misc-docs-v1-0-fddb72511357@cherry.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMwQqDMBAFf0XeuYEYRaS/Ih50s9EVqpJtiyD+u
 1GPMwyzQzkKK97Zjsh/UVnmBPkrA43dPLARnxjOuso6W5iPKBm/kJrcU1fWIRCRRerXyEG2+9W
 gL9E+Tn/9xPS9JjiOE3iCgqZxAAAA
X-Change-ID: 20260203-misc-docs-1dca48ffccc0
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Your Name <your.name@example.com>
X-Mailer: b4 0.15-dev-cb172
X-Infomaniak-Routing: alpha

This makes use of rST version admonitions for config settings in
anticipation to make each config setting a term such that we can
cross-reference them easily and have an anchor in the output for easier
link sharing. Then it migrates current "verbatim cross-references" to
actual cross-references using :term:.

This adds version admonitions for sections applicable only to some
versions and for program arguments.

This separates the b4.thanks-pr-template and b4.thanks-am-template as
well as include verbatim the example templates from the repo (for
b4.shazam-merge-template) instead of vaguely mentioning them.

This fixes various typos.

This adds external links to manpages.

This adds missing info on settings/options version deprecation and
addition.

This sorts the config settings per section (glossary), both by enforcing
it at the directive level and also in the text.

This adds missing b4.linkmask reference to b4 am/shazam --add-link.

I haven't changed the program options into a glossary, but this is
something I could do if there's interest.

Note: ``b4 send`` seems to be picking up
``Signed-off-by: Your Name <your.name@example.com>`` from the git
context in patch 11 and adds it to Cc recipients for some reason??

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (21):
      docs: maintainer: ty: fix incorrect config name for templates
      docs: prep: add info on when range-diff-opts was added
      docs: diff: add info on when range-diff-opts was added
      docs: contributor: send: fix sendmail typo
      docs: config: separate b4.thanks-pr-template and b4.thanks-am-template
      docs: use rST version admonitions for command options
      docs: use versionadded admonition for sections
      docs: maintainer: use deprecated admonition
      docs: config: provide link to git-config conf file documentation
      docs: config: fix discrepancy between example strings
      docs: move sentence-ending dots from within the last quoted string to outside
      docs: config: add missing dot at end of sentence
      docs: config: provide link to patatt
      docs: config: provide link to git-send-email manpage
      docs: config: fix double colon typo
      docs: config: provide example content for template files
      docs: config: use rST version admonitions
      docs: config: migrate definition lists to glossaries
      docs: config: sort glossaries
      docs: cross-reference config options with :term:
      docs: maintainer: am-shazam: cross-reference b4.linkmask for --add-link

 docs/config.rst               | 615 +++++++++++++++++++++++-------------------
 docs/contributor/prep.rst     |  49 +++-
 docs/contributor/send.rst     |  34 ++-
 docs/maintainer/am-shazam.rst |  12 +-
 docs/maintainer/diff.rst      |  16 +-
 docs/maintainer/mbox.rst      |  12 +-
 docs/maintainer/pr.rst        |  13 +-
 docs/maintainer/ty.rst        |   8 +-
 8 files changed, 437 insertions(+), 322 deletions(-)
---
base-commit: 38c61e3d0a1b2b14ee75f3d763362fd63e162849
change-id: 20260203-misc-docs-1dca48ffccc0

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

