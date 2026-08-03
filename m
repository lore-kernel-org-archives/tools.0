Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB630F924
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 15:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771317; cv=pass; b=J+AJ4OBvOx2ydAP05d1voipvLrBST5x1hxIOHU37DpbL2jaq+MJD8BGSucWXm42piBGyr/DFMcz5fyvdJozBwq6j9JI+KEMMidYxldwjozJKJhWvd7c4vWcPMZW4JqZz3wAo7WkkYHlDHF7CsgxbYw8Op/OX4YEAwX0fB6tgLXc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771317; c=relaxed/simple;
	bh=yoLldfP2TeZXJF1vELk/27IWTxkcD5odcBxqez8H/YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChNpUvIptG0AhrjNr2OTNV8oVG/3MCGlsidT3DODrWfRAZYydKTsT9yYwl8lYUTuluiLSg03/ZGcePM45ORI8zovdQz7MAXVy0fkpVvOSD0axxTKBf+i9Isiy7UMfbSax+tQGJ9d49aqWYB+Lj/dNTR8S+K1ecd5CFlKH0iVxHY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ZrEo5RGB; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ZrEo5RGB"
Received: by smtp.kernel.org (Postfix)
	id 049001F000E9; Mon,  3 Aug 2026 15:35:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785771315;
	b=hjbk6roqqGKJRW+D6yM8eqN+JIeW7N6C8kcYfEQl8Y6zDSnUgtabHGqRmc6jti+8iGvQ
	 8LxHilcgKSoPd09sBnmAGXgY+m/54Omf4H2Ah4VcnI68KN6gRYNaqlqWpdXi0vzE9yZg/
	 CegP5McUWA5V8/uwFj8T4YpOhijWvfUKJvY1goXrT97yK7/MCr3gCU/O5EHLMQ9uBxFVt
	 TGWwF2tiG/Aq/XaB0v9V6Qrrr6jy1G0JsMW2LlEtGgoaTvFUCTaYGoOvlqc4bVEG/q2/L
	 RPBEKCME86eMjzTKzlNDTib4V52v2ObslNH9xaauxFyEV00htuSNHzpFSt4bOHutm2g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785771315;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=DrKdgLnN0Wgu43uNuo/KtvDlB3Mtr0I8cWstTG0n1h0=;
	b=fR/7+hjW3FeGFV7hW5bBs4p1bMDcoP1mGfxC4N5amwKpUSdCOXqqccZ5DTGHM1BsOwLd
	 QcTHQJ0ZUL3PbUvhWh9jPfQF3W+RFXrDVYZnCVn5WXrzmQy207E+fOyI2xeJY4ot1LD/I
	 +P0sie9cyBkp1b3tRn0HCoAuWmQLTzccCE6+K0OsPJKYJBbSdj0YfB0+8lFlJzSRhuqs4
	 wX8ywFWNVqQs9/Xkl4nCUIYvHDcsNoSieFDvvNltHfcleB+vQTEngdjsXVHhekDDDwxKS
	 dHVQqW1S9DmiMVc6DbgXgkt2PfiIPKyOTQh7IOuA9C7t/aUvt7PWhazvdJrKo2OE4Tg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=ZrEo5RGB;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AA671F00A3D;
	Mon,  3 Aug 2026 15:35:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=ZrEo5RGB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4AA671F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1785771312; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Oeg439BDBvzWx5nfyzUfO0tbJuIcrBdzIVZ1mQhcgnFuxydUlDl3mekg2vR1wn71KTm3bmWHj+qKf/reHymOKwG0LxgOzI22N4Z1VqmtnI+kD+/tWfujADSHmotwrmaTc6SQLYx7LoQYwtkdv6xzu8zIWGuEx9yZVh6YC4KKQyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785771312; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DrKdgLnN0Wgu43uNuo/KtvDlB3Mtr0I8cWstTG0n1h0=; 
	b=cXWBHXUKjN+dGy/URRzE3MTDOvGGGfc7v46wX8hlatPRuLtQWFo9AekPvOfS715w5XPhQZIGEwLRvBC3qezYWeaiDg7ieP0dHL2giVFOsCUODpJ0WWvG50a/BErKQCAsXdyZYr+qeyWQ9bD8AM09a1T7TplXmC/YrRXK/+Z/ZpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785771312;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DrKdgLnN0Wgu43uNuo/KtvDlB3Mtr0I8cWstTG0n1h0=;
	b=ZrEo5RGBn3A1jUaFlXwcmCtryECGsLjkycJp/mmkOYCSj5V+G3fdNvnoN1GQ4X8m
	liuE6zfBxW6tzsZmXqO7CSg2wJPmwhvpJsXGGcapHKwcfWbIjeQpkGearuSenrSAGnl
	8vIQ2oDDbafnjXuq5yaOqbiWK10VoeHbKOonuKXU=
Received: by mx.zohomail.com with SMTPS id 1785771309393743.220309992302;
	Mon, 3 Aug 2026 08:35:09 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v1 2/2] drop mobile banner rules made unreachable by the drawer
Date: Mon,  3 Aug 2026 11:35:02 -0400
Message-ID: <20260803153502.32096-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260803153502.32096-1-rito@ritovision.com>
References: <20260803153502.32096-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The previous patch hides #banner below 848px, so the rules that shrank
it there no longer apply. This includes the #banner ul clearance from
commit 6898150 ("Fix mobile series follow-ups to preserve desktop
layout").

No rendering change.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: LLM [codegen, review]
---
 korgi/static/css/main.css | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 60538d9..d6fb3f9 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -504,28 +504,6 @@ dt {
         }
     }
 
-    #banner {
-        width: auto;
-        margin: 0;
-        border-radius: 0;
-        border-left: none;
-        border-right: none;
-        border-top: none;
-    }
-    #banner h1 {
-        font-size: 2em;
-        margin: 0.5em 0;
-    }
-    #tux-gear {
-        width: 4em;
-        height: 5em;
-    }
-    #banner ul {
-        margin: 0 4em 0 0;
-    }
-    #banner li {
-        padding: 0 0.5em;
-    }
     h1, h2, h3, h4, h5, h6 {
         line-height: 1.1;
     }
-- 
2.51.0

