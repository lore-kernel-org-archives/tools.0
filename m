Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061D11A9FAF
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684045; cv=pass; b=B/HeQKNmkYDA8wJRs1e+bwd/gILxCtCY8p4GoYQAuySfOVfffay4QUzhcjKT6/w0v5F1mnm/yTB5yD9nyLjaDvHV97zPPTnjcxqLdTR0rTa5AtScRVDm2H8l5s5EQz5pVEtE5R570Jy7kovTnryNWWtS6PGT7uofLDTfWK+fwrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684045; c=relaxed/simple;
	bh=B6jUsYkJWmn68CcqBnPzm2yrtsL6GT9HSlu/BLkN/y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2yzMtPgbqKDUMWl6bfymsRJM+HZilzk/1OY0w5304F6ncAYdgpwu3AREGncV4rockqcnWmf9Mc3sSWm8xVQ9VwGxAAfV15dB+jd0yPlP5ZldEV+mdHQFgFWnV4z/oL5oPW3iOIbLAHTPCsTaXliysvaefE59T5sA3lC85nBHX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=mIJ3Fn54; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="mIJ3Fn54"
Received: by smtp.kernel.org (Postfix)
	id B6164C19425; Mon, 16 Mar 2026 18:00:44 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5606BC19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5606BC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684039; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EHg2Xpx96jJoKMI7wOPF3+aml9Cza8bfqKSYL3p5ZnwY3AmPG8k1lLw6SIBzZ5cgUnr+bvhfdu7DrB08sL1hZZTG6yGqxEgwsdgmed8Jv1BzvCjjGVR0nvqWLTXFK7WUPM7iHbM3+JxfagLJZEdYNRhlNvtileungtALo6Tbh38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684039; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3VWelUMcp6hAjdfiqlJhsfR8d14WYOG4633TmMMYCME=; 
	b=DC3JfNNAC1Q93u0YIrEpYVfdZFNxTBsYbVVg2LiWU6wtZJuOlg1XOWGZHfafk035T2KU9ogkv1NbleRO/hU2ePNhny2mU3RxNzTMRdDfbE1HEh1467NKmhsfSNQ9Z6DN/QIWcgBoq3nwl7PqG/iauoz5R7xSlYugucadn1uxHgA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684039;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3VWelUMcp6hAjdfiqlJhsfR8d14WYOG4633TmMMYCME=;
	b=mIJ3Fn54OV5Fk/kHAQp2wR4TvZ2owE2eqpfqtTGaGkFLGW0ZoZVZrC+JYLTX1+rG
	QgAuhGt41DtW+mQS99BTO8Hdubi9DjaqzZ5KIBPEo/kQZ8tx7zb6yqL1FXOwgnofI8x
	evDoQXD43ZIeOh87hlINV3kjpDupbVzx7E8C87gY=
Received: by mx.zohomail.com with SMTPS id 1773684038060658.4265895863304;
	Mon, 16 Mar 2026 11:00:38 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 0/6] Allow site layouts to render properly on mobile devices
Date: Mon, 16 Mar 2026 14:00:30 -0400
Message-ID: <20260316180036.71949-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently, pages on mobile devices render against a desktop-width
viewport, which makes the content appear tiny and forces users into
a pan-zoom dance of pinch-zooming and horizontal panning to read
content rather than simple vertical scrolling.

The first patch establishes the correct baseline by setting the
viewport width to the device width. Once the site is allowed to
render at actual mobile widths, however, numerous latent layout
issues emerge. The remaining patches address those issues with
targeted responsive adjustments.

It is not a transformative redesign and is not intended to affect the
desktop layout.

AI assistance note: this series was developed several weeks ago,
before CONTRIBUTING.md instructed contributors to record the full
model version identifier, and I could not recover the full identifier
from the local session metadata.

Rito Rhymes (6):
  add viewport meta tag for proper mobile rendering
  prevent wrapped headings from overlapping with text above it
  add 848px mobile banner adjustments to prevent overflow
  add responsive extras and footer layout adjustments to contain
    overflow
  contain horizontal overflow in core content and homepage releases
    layout
  improve mobile rendering of docutils tables

 korgi/static/css/main.css | 154 +++++++++++++++++++++++++++++++++++++-
 korgi/templates/base.html |   1 +
 2 files changed, 153 insertions(+), 2 deletions(-)

-- 
2.51.0

