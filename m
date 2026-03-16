Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DF5283FE3
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684058; cv=pass; b=kfb3ulvyHcBvgzEcCJP2vr+sevcIWLoS3JvayGewmlV7C0FVNMfU60fNB/LmrXkMXb1ZbTYd9JdSfMj1jO4l738GVtT6wvV/Nj1d8hTloK6MhV/YwUFU8YbxPOFWeea0j69rk0onJqSD5PcpadGC37tOaR8VfMDCCrRQXpR8EH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684058; c=relaxed/simple;
	bh=u20990myLA+yvU1eF5sFaK08POQdr0YCHLsQTMU+Tmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JT6S3gyy880YuVW5d43OlPhM0RHOxPeSc/5PNPSpQAOrughjzwbG7+SoTr3LX3re4R7tgCAy4ju0yze01lOh8xBz7vIg+RQ+j7OGbOM9Zz83mjqyUoozFnujwHWtiUNGmKABvpX8okHv0GC3XUuwjJ9IFZ18EFcX4ANOgC8Ufk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=EfHAu3IS; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="EfHAu3IS"
Received: by smtp.kernel.org (Postfix)
	id 2FD00C19425; Mon, 16 Mar 2026 18:00:58 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3625CC19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3625CC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684049; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UvNdPZHucupjnhF+dgvdnvKju2cafFQXfA2JNM6tXz0X4W7VCE1yhCK7kBAiCdjmjwmQCRZEGWovLW/GwJ6pGTgFS0j8xvTlEDCvwfDsitThkcDtwy0mFSdEY3YMcPLBdZQopJPVbzMXz0nFP83BrcGos3aqo7e/RTh3FpvKh4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684049; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gDuXeoed1H9HkDb6OPcE8EqlmP+8nXXFIxfCJDV+Crg=; 
	b=C4Uxk5Hy2mVmdO35HXhVRk1Y9eVnjoUbxU/YPd6alFycSGTO5xvK799IlnEoVq0NqgaVOGNM/LKG1/WdD+GxsYsGb7QNXL3JpIFDguxx+k3iVjor0ZXLDjEhy2P2KXOyBhTxj/ysDhwKXDM+GbuW+6mIC+wwdOUPX/JfEuq7eBM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684049;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gDuXeoed1H9HkDb6OPcE8EqlmP+8nXXFIxfCJDV+Crg=;
	b=EfHAu3ISanZkoj8954/mFTndiWoWKfX/InTY8ckCl+su265FkbTWw4qQYIGRg8tO
	9LUcnAqswaSO8akMPcwCETCJOP9fdrKw4OQSB2XpvIBwop75ciPr7OL+pKwYXJcccyG
	gVztMVx80KCiG4LC9dmAn8Iy/Jts3jIhy4f4DFAg=
Received: by mx.zohomail.com with SMTPS id 1773684041938727.8152795704865;
	Mon, 16 Mar 2026 11:00:41 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 6/6] improve mobile rendering of docutils tables
Date: Mon, 16 Mar 2026 14:00:36 -0400
Message-ID: <20260316180036.71949-7-rito@ritovision.com>
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

On narrow viewports, docutils tables become hard to read: the releases
table compresses too tightly, and the signatures fingerprint values
wrap and lose scanability.

Both /releases.html and /signature.html use table.docutils, and their
cells contain data values (versions, dates, fingerprints) rather than
sentence prose. Keep mobile behavior consistent with desktop by
treating these as single-line values and preserving readability.

Make docutils tables horizontally scrollable within their container so
cells can keep single-line values without forcing column collapse or
value wrapdown on narrow viewports.

Adjust border drawing for the scrollable table state by resetting
default cell borders and reapplying explicit grid edges to avoid
uneven/doubled outer borders.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/static/css/main.css | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 16d97cd..04955c6 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -382,6 +382,22 @@ dt {
         margin: 1em;
         padding: 1em;
     }
+    table.docutils {
+        display: block;
+        overflow-x: auto;
+        -webkit-overflow-scrolling: touch;
+        width: 100%;
+    }
+    table.docutils th,
+    table.docutils td {
+        white-space: nowrap;
+        padding: 0 5px;
+        border: 1px solid #ccc;
+        border-collapse: collapse;
+    }
+    table.docutils > caption {
+        padding-left: 5px;
+    }
     pre,
     .literal-block {
         white-space: pre;
-- 
2.51.0

