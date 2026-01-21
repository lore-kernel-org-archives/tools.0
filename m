Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614E23507B
	for <tools@linux.kernel.org>; Wed, 21 Jan 2026 12:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998527; cv=none; b=SoAhu41OphG2jHcawKjj5Bq2ywvgeUtE0Gs9+OxgR7wOeUoqKw2xEmuz8QXgF9FCIbn43g16ioBRNSPLY78b8E4FOsEiTPl6mlWdyvhQADQLk1SOrw3tY3JhnWS8O21hItkrpnmiTpInH/mqV/DoNWuZ1T0QyI6qHVBDeoWULrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998527; c=relaxed/simple;
	bh=B5Ddvzwciy5BjEK1epbii2LoZfQkQYuPAD2quMYg1zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eZMCbhqLOt1Pk8YCM92/dy0Bawtmh1RaXSeX1pk5NA+Iz99F0LJ+LPZ8G512HGyS08MhND19mCg6JqNIbSGtPdTYC9bqY5dUYJkpye1y88Xbn6I4hy35oSa2yO+pPTGSuE//jBkIlCs47AS5OjgsWatsSgI8BiU70xbXdr0EXUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yruUHV/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yruUHV/r"
Received: by smtp.kernel.org (Postfix)
	id 8D1FEC19421; Wed, 21 Jan 2026 12:28:46 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1531C116D0
	for <tools@kernel.org>; Wed, 21 Jan 2026 12:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1531C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B310C21A82
	for <tools@kernel.org>; Wed, 21 Jan 2026 12:28:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB4646070A;
	Wed, 21 Jan 2026 12:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EAA9119B1212;
	Wed, 21 Jan 2026 13:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768998520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g3pZ+B0eOqcU6jAkKc98YjnR6cWBscam1T8eQPjgegM=;
	b=yruUHV/rgoVJCZcC1T2V7Ejyr2yN1RtW7HKpvVNm7u8fGOdjDfq8HDSDOoX4WatPwHO0d+
	9XvxVBlUkFeryIO814I42YzmMnzXn/4t935pKvea+gmLH6w94rgWnIpxkBs6Z/txoXOaMn
	vtA03GQndIafaK/gYFsFxiOHft9sK6a/7OuGtX1tpkndlQokC+Xv13GEa7JGLYHZ3KxeRT
	ZnI+Ry1/cv9c9RvGp1vptTRSj6q80062EzBoLnzWPkAF09mZ9K7g7XHPcPXQ1Kcn4Z5tFH
	0ENdVqY73EJYW3SdZ02IqGN78Qie9rUdwd2VlilkKttDpN0uqcYDsNwh+Grg6Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 21 Jan 2026 13:28:35 +0100
Subject: [PATCH b4] docs: document --set-presubject and b4.send-presubject
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-docs-presubject-v1-1-d625a279f1c5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHLGcGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3ZT85GLdgqLU4tKkrNTkEl2DRNNUY7Nkc5Mk0yQloC6gVFpmBdj
 EaKUkE6VYiBhUOcgopdpaAJMODyR3AAAA
X-Change-ID: 20260121-docs-presubject-0a5e36c74b5b
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=B5Ddvzwciy5BjEK1epbii2LoZfQkQYuPAD2quMYg1zo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpcMZ3TbkqDr85MfoLTzWubzxSowTps6O35Jrh2
 MAnGR7hA5iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXDGdwAKCRDRgEFAKaOo
 NgBLD/4s7kGxqwkL3a1CwsSHTd68NbiMkqiv5fgjIGte+ekgLAiGgn6VKbT52wrIYvsR2H5igl5
 cuJLzt9VOzSA4ldTQsO1R1Wlyxn8DDwFentgKC/BMt0DgXHHXpODrcXFwTfOiYEK/ZFgKJDuWyA
 0GoT3fxFLpQS217PKXb4p7Hoqu29nDDl9nv0AKj8PvVh0HFu83ZrkWEvo38zGUKPEccgp0/p8oA
 5nWOumpNlrcuzByBeSidaCX8PnRp/GU/C8DtR0aOmjnKY4dOGM84KWBmIQ8QcUiO5Z/4H6j85Ol
 miDdW0JBDd5G2rsenhH+cUrK7ILE5IFvwyQ+s2itzrqPwq0piOYV8gF1DbwCPk85bMHSQWDx+jS
 /KN33+OEEhjEpv6sOCq4fXrukRRfLjNH/BAFi9t0On3BWxLCuvAGUCmSc3zPspILHN0KDReo9aJ
 QR+3yhDghgSNbZ4rm+2wxHSHbg7EIlQs4DtBsFj26XjjwGmRdMRUmYzbBXgbrBppjjUeDH+o5gU
 Zr8FmpnyV9a6im67GipzppuJgW2PvY90nDDDMX+scQZU/5FVlGKwgYjr9S9zJR4XvqdEo0TnaXj
 adqpdczeerQ8opVRUvQXKO98jHD1UdI2OJc7kG+zmsFpq2ELm7H4IAxNlISKbNpttUuC5Q7FTTA
 9op3eQF6pifwfzQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Document the b4 prep --set-presubject option and b4.send-presubject
setting, added by commit d7232f5db2e4 ("Add support for setting a
presubject").

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 docs/config.rst           | 11 +++++++++++
 docs/contributor/prep.rst | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index a1145af..af470fc 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -437,6 +437,17 @@ Contributor-oriented settings
 
   Default: ``None``
 
+``b4.send-presubject`` (v0.15+)
+  Identifiers to include before ``[PATCH]``. These **must** be enclosed
+  with brackets. For example::
+
+     [b4]
+     send-presubject = "[myproject]"
+
+  This setting can be replaced for a series with ``b4 prep --set-presubject``.
+
+  Default: ``None``
+
 ``b4.prep-perpatch-check-cmd`` (v0.14+)
   The command to use when running ``--check``. The command is run once for each
   patch to check. The patch file to check is piped through stdin. If this
diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
index 18c710d..59cedc0 100644
--- a/docs/contributor/prep.rst
+++ b/docs/contributor/prep.rst
@@ -444,6 +444,27 @@ modifying defaults for some of these flags.
   Similar to ``--set-prefixes``, but will add prefixes to any ones
   currently defined, as opposed to completely replacing them.
 
+``--set-presubject [PRESUBJECT]`` **(v0.15+)**
+  If you want to include a project name or any other identifier before the
+  subject of your patch, you can define them via this command. These are
+  placed **before** ``[PATCH ...]`` in the subject, and **must** be
+  enclosed with brackets.
+
+  For example, running the following command::
+
+      b4 prep --set-presubject "[myproject]"
+
+  Will render your patch(es) as follows::
+
+      [myproject][PATCH ...] <title>
+
+  These do not collide with prefixes set with ``--set-prefixes`` or
+  ``--add-prefixes`` or patch versions, which are located next to ``PATCH``
+  in the subject.
+
+  To remove any presubject you previously set, you can run ``b4 prep
+  --set-presubject ''``.
+
 ``--show-info [PARAM]`` **(v0.13+)**
   Dumps information about the current series in a format suitable for
   parsing by other tools. Starting with v0.13, the parameter can be one

---
base-commit: 477734000555ffc24bf873952e40367deee26f17
change-id: 20260121-docs-presubject-0a5e36c74b5b

