Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27F30B520
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684047; cv=pass; b=O8/DC0jVTxs5991MIvzcdvc6mddzPv4PiFAgRNzjujXRlR2ejBi8cTFyg1z3YNEvc//N7avRD4rxunYNDe5THilnMhYTRIvSZZDkb+vbcdOfbKAZzzq7ywRpdCJHSFcbkElE5hTNhm664oIJ+c97HEq3fvShh3smVSm/n4R6cH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684047; c=relaxed/simple;
	bh=c+dxwj18uaRElhTHevgqKwXpm3SpKGXBKeTIFY34oaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAbDmQjmkfYSdIW3PXBB6ca77ZSD3KgPkEKx8+CntynPVZyjzVRkyQG+u3Sq5WwiTG3xWTF5V4BarQHn3MQqTRXLJERcF9UaSA4/0gNjxcn10feKHB4skFSDudltF4fAfjP0KNwBxigMIG+JmBp6Lj+QtrP6XqGGCRGc2LC7t4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ZWTsgG2G; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ZWTsgG2G"
Received: by smtp.kernel.org (Postfix)
	id D0E75C19425; Mon, 16 Mar 2026 18:00:46 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9D52C19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9D52C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lyaxe3K4lWgN+TUgu0UrI99UaHsffrCPnES0aXdzOfwqJVIPInlxdEQ4BWa8bHdishLfdpKx3nwuknanFURGauUeRl2A67njPnOo6fpr0GG5PerKPW2HmeH09ClaV7kVgiAXs6YI5bdZjen+zx4PbISPqRP9+4iBLkNz3fEo5d4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684041; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MzEy0fon3dbt7yaH9Pdyy4RcS1ToxJU3Sznd+tpRDmE=; 
	b=Bwyk7DV8pCgOQsX9VVcaGNait73ie7KGg6WdIDwv/wiUBtgkW2FaW8MpJG+Fsd8XxbhlYmNx2meToMcxBVu/HEsJ+z+TnEqM4tG8YQuNYDLh6qLOVGJs9wFK61OYJYAjKNjBGft/KLmBFwUyOrze04wvxBXs9Pf6lDMcw2xthr8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684041;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MzEy0fon3dbt7yaH9Pdyy4RcS1ToxJU3Sznd+tpRDmE=;
	b=ZWTsgG2Gp6+owanfirgV5jUuUvwUeHAfb4aRajvA1woAidNB8pqMnFlsLcLyjZr+
	k4ZXXifu/+DMFjJxPrPiZUBdJrD3e8lC3LHD6i8NHVpvQbkvd7+Ukm4ZQAE4J+XDTUo
	hzFD21PgXLu09GMUoBfhclggcqFdDrzkY8XvUbAc=
Received: by mx.zohomail.com with SMTPS id 1773684038824224.03688872134387;
	Mon, 16 Mar 2026 11:00:38 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 1/6] add viewport meta tag for proper mobile rendering
Date: Mon, 16 Mar 2026 14:00:31 -0400
Message-ID: <20260316180036.71949-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>
References: <20260316180036.71949-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The site UI is broken on mobile because pages currently render at
desktop width on phones, which makes the content appear tiny and forces
users into a pan-zoom dance of pinch-zooming and horizontal panning to
read content. Adding a viewport meta tag to set the viewport width to
the device width enables normal vertical scrolling on small screens and
establishes the baseline layout for follow-up mobile fixes.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/templates/base.html | 1 +
 1 file changed, 1 insertion(+)

diff --git a/korgi/templates/base.html b/korgi/templates/base.html
index 9872e08..ce1d5fb 100644
--- a/korgi/templates/base.html
+++ b/korgi/templates/base.html
@@ -3,6 +3,7 @@
 <head>
         <title>{% block title %}{{ SITENAME }}{%endblock%}</title>
         <meta charset="utf-8" />
+        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 	<link rel="icon" type="image/png" href="{{ SITEURL }}/theme/images/logos/favicon.png" />
         <link rel="stylesheet" href="{{ SITEURL }}/theme/css/{{ CSS_FILE }}" type="text/css" />
         {% if FEED_ALL_ATOM %}
-- 
2.51.0

