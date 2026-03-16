Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A63B33A6F9
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684056; cv=pass; b=pemHsO/zr7gU6Sb+/K5tScMgrokek+/XnPSGx9ju8CdXgqixeZUmv4URcJ2nvB0IUNbzIdpgxsyWwmQwkia30Og+zHlnTIkeoynutb9ZFgNwWSx1/m1jRJtaloJD0oDNAH6HSI2EZIOqwU/R89nglEgbUzucWdF2edjkNG2OMdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684056; c=relaxed/simple;
	bh=6reXH8/fO1Sn8RfWi9jWe1joVxJWmlgFbpNRq3hio3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puEcugrL8b2NAzeZS8yCbaRcji5sQB8QcvsaZ/R2O1gLiUPUhIya8EN2TGDcemjCklE4Tlvdnf6VPQNwYvfQNpR5svfzrz13mYDx/i+3HXYkBQal3EhsnAqQxxyHCOSiKOHuz8thLOubELoWg42kXT3cxkG/21Z0fNs6RxSPtW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=YDtXcb/E; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="YDtXcb/E"
Received: by smtp.kernel.org (Postfix)
	id 52B60C19425; Mon, 16 Mar 2026 18:00:56 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECFE4C19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECFE4C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684047; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jSW/bdzmGtSuVqTI9mM1zMBBsQ/omjWnI53qELG0+vzEA6M9rsGYfoJbKfsoOwGPFWmtbUxqppoNoGwb7Sor5ElGtkErOYeRD9ijVQwKs1mhW5Ra3ZQn0ybD6+J688XsQ53q+Dd9WllokDyJedQF7Fa0mMXaFMbjhnOpJLyDI94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684047; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H7FvGX0UiGC9jqFP438CACFR+UIguTb5q6aCytJ46oY=; 
	b=do6QTOixTtQpA/tEuEoxk/FjWxYJ9JzzFI5zkSBtHfHd/Vtg4NfnyYv6JEgjXfz6E5DUANlyNuRX+HGRu3l+daVAMgPuqlRLosL7SyDD1gfL6ZluTuki4/irxmGbdHzngvO8CJ3TSivprOkYQk+9QdST6L2ttGjWu8wImoebGes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684047;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H7FvGX0UiGC9jqFP438CACFR+UIguTb5q6aCytJ46oY=;
	b=YDtXcb/E3rs6U0yG0nHspITzltsrrN5w1RgpoMGZeegr43iHRU7ILwsqBHi0LfeB
	/Y+ybtpaKWuaFOX1tc0wtKAVquPowj6X+6oWePxB3x+SR84vfiEV3loT+68L1hHlT22
	TQNkxylRAtelXQF1PZ274IWrIZ3a47CmxbQbl5wo=
Received: by mx.zohomail.com with SMTPS id 1773684041282349.7087327035093;
	Mon, 16 Mar 2026 11:00:41 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 5/6] contain horizontal overflow in core content and homepage releases layout
Date: Mon, 16 Mar 2026 14:00:35 -0400
Message-ID: <20260316180036.71949-6-rito@ritovision.com>
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

On narrow viewports, fixed-width content containers, homepage release
sections, and long preformatted strings can force page-wide horizontal
overflow.

Realign #protocols and #latest for narrow screens so they do not
overflow and can wrap down as needed to fit.

Make #releases scroll within its own container, and keep release-date
cells readable on mobile with nowrap and horizontal padding.

Allow preformatted blocks to scroll horizontally within their own
region instead of expanding page width and creating page-wide
horizontal scrolling.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/static/css/main.css | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index d20d8b6..16d97cd 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -360,6 +360,33 @@ dt {
     #banner li {
         padding: 0 0.5em;
     }
+    #protocols {
+        margin: 1em 0;
+        width: auto;
+    }
+    #latest {
+        margin-right: 0;    
+    }
+    #releases {
+        display: block;
+        overflow-x: auto;
+        -webkit-overflow-scrolling: touch;
+    }
+    #releases td:nth-child(3) {
+        white-space: nowrap;
+        padding: 0 0.75em;
+    }
+    #featured,
+    #content {
+        width: auto;
+        margin: 1em;
+        padding: 1em;
+    }
+    pre,
+    .literal-block {
+        white-space: pre;
+        overflow-x: auto;
+    }
 
     #extras {
         width: auto;
-- 
2.51.0

