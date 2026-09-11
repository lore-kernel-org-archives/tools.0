Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C6445BD7F
	for <tools@linux.kernel.org>; Fri, 11 Sep 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131014; cv=pass; b=nymR/Se6SQmJcE3vW7fneyGWqf4lnqZp9SISWq3gkpPlEuTeGKs0Y25501reJQOCMsIyPML10c70uazcL3c+1TdQURPg3Pm04ubAh4eD6kDwUa3v5oXlVbD8hXVHta+z8vNwi8fm5xvuESq5HSn5LPbid8SdH+XcBSfzO1xAL/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131014; c=relaxed/simple;
	bh=vuka+20azsWGXj93gmii7blctAjok+sHMBI9YLF5E0w=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mp1RA/If5Qsd9/yJwXJQwyPoZIIIo76C9tBGTd/sLgMFL9Da1vi8gqmRNjr8V8t9gcB6OA8gd0Z7NeqDV5p3Bm1YykyxdvVZVxbSIAkK2XXoTJWLh+Wf1gCZ7LjZ1Mdk9SZq0G+9YWnbJBeidW1qttOZkmgMoKXJHH7+t3Z/blE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b=q8ssZkVD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vates.tech header.i=@vates.tech header.b="q8ssZkVD"
Received: by smtp.kernel.org (Postfix)
	id 383701F000FF; Fri, 11 Sep 2026 12:50:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.255.28.34
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789131010;
	b=OujvrZokHaB72RJJyxoYoNAAN6skJuhnl0MDNFO76ZhYSrCEgLgTR1WfLFIOReMf3Ey2
	 AizKS1Y4Wfvk1BrTnZlVSdJgNW+XRUq1+p3JYO/iDmDwwuD1lcI4Da43k5fbvTWHzVOJT
	 20ky/hZ15r1FO4WfudCrOYDUBoRsV400WMyAFD4alxX8fVlBBsAfz9uH/ber3u3YEtnP6
	 jvSWtbZbqmi/wbV8tcV6Yv9QplIcC7m6ElSjEH4z8wnMM5RWBmmSG6bBYozBcDdwZEyRJ
	 9KKQ6JvbA4etpG2mxPWg7x2QUTwX+1GlA2WpN2wYiKikpdYsx9XUJEfMiQ6kTtj/OFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789131010;
	h=DMARC-Filter:DKIM-Signature:Received:X-Zone-Loop:x-campaign-type:
	 x-transaction-id:x-swg-uid:X-Mailer:Message-ID:x-swg-bid:Feedback-ID:
	 x-campaign-id:x-client-id:X-Originating-IP:Received:From:To:Cc:
	 Subject:Date:In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Bm-Milter-Handled:X-Bm-Transport-Timestamp;
	bh=YAz4JpgMHPYPnGM2fyuRtR2MTnnkc00vSySjquPDyOE=;
	b=BNTuNys1np9b7STOrukfKhwv431UI5J6blZpvHeQnw6diKV5nqictjvGQJHV6tY6bW3H
	 mc1z/rolQslDF/Kr8ej2m4SUtW3NtN8BGGXTTWSBX70dXFcN0C2rh3q7j4mB4J9QjUn1z
	 8rvjYtaq6+E/GrittXqXKSWaSfOSl1VsjeepwnCSwNoqggJq8hVaIdrh77zSqMqfnYoAR
	 XDEvVF5rYaqVzf5k+qv8HxsgymvJ5wpBBkk9abY3ykUfudhU/yK0DM8MFZpuDq1jcs4Pb
	 hrR6ZvwA6W7TYiHZYROoqFJSmZOV9ehLydSRRShvC/jmAnzvjH2/cgm/vfIqfceAf3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=q8ssZkVD;
	dmarc=pass header.from=vates.tech;
	spf=pass smtp.mailfrom=swg.vates.tech;
	arc=none smtp.remote-ip=185.255.28.34
Received: from prod-mta-13-01.swg-srv.net (prod-mta-13-01.swg-srv.net [185.255.28.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3806F1F00893
	for <tools@kernel.org>; Fri, 11 Sep 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=q8ssZkVD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3806F1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=vates.tech
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=swg.vates.tech
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=YAz4JpgMHPYPnGM2fyuRtR2MTnnkc00vSySjquPDyOE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=q8ssZkVDSj2vDX+x7SSGOkHOKbaA2jN+V/yMvx/8acxSjeDAz17j0f25OeOS+CA0ypXpsxKkY
 m02UkrX6DwRUNZPeiEP2U5zjTKzaRObN+Tm18wyGmo7uaPvcMIuLTPAiMTVIdFvAraK3dv2q/Rx
 aEWGmk90ZOonCeYb0uSieiMHYL72O0eY0jYkmzWD3/J9lE3rLTRberGIl0dcaUDk7/SCPCLb40W
 vopGNOMDpS7ZfH5HbsE36BKvPq06elXdEh8HWajmIwf6tTD164Q5KyMnc8WgBdSgRWv0d+/2kqJ
 zF6f9uwJ3rXWUzdGHXXiCq7o6AodxYJHhhtfFOLGWMPA==
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender: 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id 1a09084942a000c4f3.001
 for <tools@kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:50:02 +0000
X-Zone-Loop: 5d1168b501bab05e86d9ccc688148c98c1b23411042e
x-campaign-type: default
x-transaction-id: d7668fc8-57d3-4766-aa68-1c6d6995f313
x-swg-uid: 01-21211c33-eaf5-45a3-b63e-8d709da64162
X-Mailer: Sweego
Message-ID:
 <1789131002.8631fc262581453bbf619ec5b2062170.1a09084942a000c4f3@vates.tech>
x-swg-bid: 1789131002.8631fc262581453bbf619ec5b2062170.1a09084942a000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Received: from leducb.tail4c4a28.ts.net (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
	(Authenticated sender: baptiste.le-duc)
	by mail2.vates.fr (Postfix) with ESMTPSA id 3EF4B81E25;
	Fri, 11 Sep 2026 14:50:02 +0200 (CEST)
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [b4 PATCH 2/3] docs: correct stale defaults in the configuration reference
Date: Fri, 11 Sep 2026 14:49:58 +0200
In-Reply-To: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
References: <1789130860.8631fc262581453bbf619ec5b2062170.1a09082676a000c4f3@vates.tech>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789130778; l=1475; i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id; bh=vuka+20azsWGXj93gmii7blctAjok+sHMBI9YLF5E0w=; b=0saOpFTeMQx8HC6ftW5ZOSFgeP8ytF4YBb6fkT+qyUXa/utAPLfPol/H/rK5BIoeBgP3VHW2u FEShWgfGuZFDTNs87f29BNqLTouvXiOqW6B8ARGGDtgjNOhq2NaZtYG
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519; pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789131002323

Fix three documented defaults option which no longer match DEFAULT_CONFIG.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 docs/config.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 83a81c9..c73fd06 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -86,7 +86,7 @@ These options control many of the core features of b4.
      If you want a shorter option, you can also use
      ``https://msgid.link/%s``, which is an alias for lore.kernel.org.
 
-     Default: ``https://lore.kernel.org/%s``
+     Default: ``https://patch.msgid.link/%s``
 
    :term:`b4.linktrailermask`
      Overrides the format of the ``Link:`` trailer, in case you want to
@@ -97,7 +97,7 @@ These options control many of the core features of b4.
 
      The ``%s`` is the placeholder for the message-id.
 
-     Default: ``Link: https://lore.kernel.org/%s``
+     Default: ``Link: https://patch.msgid.link/%s``
 
      .. versionadded:: v0.13
 
@@ -119,7 +119,7 @@ These options control many of the core features of b4.
      Specifies the server from where to retrieve the messages specified by
      their message-id.
 
-     Default: ``https://lore.kernel.org/%s``
+     Default: ``https://lore.kernel.org/all/%s``
 
    :term:`b4.save-maildirs`
      The "mbox" file format is actually several incompatible standards,

-- 
2.55.0

