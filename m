Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0616B3BB111
	for <tools@linux.kernel.org>; Mon, 20 Jul 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784561927; cv=pass; b=DKwOeeO8l0gxrpunhfTsNfq/3lGR8YthIyQqAK0epTho6grwooRWXt+IlPmjGdBJZu9N/qZaw83YsVhkTfaGIkUsr5DJZsbn+OROHhd9KtFckrr/JIvNsmodpEvMdsyqt637krskc2dpLVnIEmjzAeFUoPrVlRI6JSXKmBsldv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784561927; c=relaxed/simple;
	bh=bfCKsU54OABgCKeJvoAi3RdsGBdziXD9ok3nYyo143A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:content-type; b=UyNYnC+B2KabRbFKdsUhndeNHyMJ3lrcm05psNCBHtA9Y3NwqM9rMNH60a3zAOaQMo+ouiYHZ87wSg2kozBkCb2ci7bPYdLa9Dx0RT+GNfbQJkANZV+FYj+hPMNTRhM3f/Jkrfom3wVAGq6KdWd8HSq8g8O9JGmOkaid0hSNugA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U3b6RG+7; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U3b6RG+7"
Received: by smtp.kernel.org (Postfix)
	id DEF661F000E9; Mon, 20 Jul 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784561925;
	b=EIFlYqTb0vUhv4ct55JRPNCBuQHDy4/stiUmmRkpD4bNG27R0Ail05wvJgWP98+rI3yo
	 Q4g3Bn9YOa2nTiBGzkNayqHgumv4JtCuNFPR1RGsxL/JGTghbEkOQNssGxyze/JQYqQ3c
	 GLBd7TaLEWg8CkJyxhBv9NVTnUhI9ueQo5ifKMN5v2MeycrS4hDXQPUkMILE2d2vLSuxf
	 4cqNhYxIU3Hlr9IdE70ZGpcHCjwKrewm/FwGjczX+bgLolCVZL8oeag0NTzmH/OZQSQD/
	 kajlIOoTPyO24TxThvfz9Mgwbwu7BMToZF5FBG327LzEOUNZ+17WLRFMpe4X3k2dFyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784561925;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=AvHu6zCCMiWq055s8FjfBDwC7fdaPp66ikZL5w+1QMY=;
	b=1Yz/6gMoNowvYj55a1WWiXfrNbtLb7YyhntSKm9j6qimI9dVudeA2S05NBymWfysMAYj
	 ud6bBXPz5pl7b+Ab0sIhiUnUFZ88IHuPe/7cdej91yJOvxALn78e2bEZbrXReevAlumay
	 7oPsJhntsg3i5jnpjLEXV9JIgXt2Qn90WWzDzu7pTtuVOw8KmLoj+Z9HDxP5rGPcfSP7+
	 TIMCR3oymvAb3HfmWNPxcvs1CdX5H5CfwhoDwyBXdAgt2u/tlAbcfZRXKaZqjgSBCHcrh
	 3L0PNZUIGP5jNiKI6dvQCfEzgooqCb0g0mwECY5NGXhyWqpmNYZl+885WJAXgCbbNOA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U3b6RG+7;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 280081F00A3A
	for <tools@kernel.org>; Mon, 20 Jul 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U3b6RG+7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 280081F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784561924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AvHu6zCCMiWq055s8FjfBDwC7fdaPp66ikZL5w+1QMY=;
	b=U3b6RG+7nuwEJplVNF5QRvduHdrXCg/f50Ymuh0C4nwP8t+W581YZ7QDSzUNfhv5E2mYZq
	q9swlhBmiSm/rtPRIqezvS4maI9VNZIoJg7MBKkd9vRm0tmY8IFUNkA2w8gudOk8Oo/EH4
	79x6baiqLbaWrSkrrJhf4JNsHvPBvfU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-6y8CrakEODOXZGae9zYiPw-1; Mon,
 20 Jul 2026 11:38:43 -0400
X-MC-Unique: 6y8CrakEODOXZGae9zYiPw-1
X-Mimecast-MFC-AGG-ID: 6y8CrakEODOXZGae9zYiPw_1784561922
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4686318005A4
	for <tools@kernel.org>; Mon, 20 Jul 2026 15:38:42 +0000 (UTC)
Received: from zen.kayari.org (unknown [10.44.49.43])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 814EB195422C
	for <tools@kernel.org>; Mon, 20 Jul 2026 15:38:41 +0000 (UTC)
From: Jonathan Wakely <jwakely@redhat.com>
To: tools@kernel.org
Subject: [PATCH] Fix typo in man page
Date: Mon, 20 Jul 2026 16:38:26 +0100
Message-ID: <20260720153840.2303110-1-jwakely@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j8ynD9OcFcAnxxekomSGJenBRGr0V-baGzYwCYnmR3o_1784561922
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Jonathan Wakely <jwakely@redhat.com>
---
 src/b4/man/b4.1     | 2 +-
 src/b4/man/b4.1.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/b4/man/b4.1 b/src/b4/man/b4.1
index 567f248..c857add 100644
--- a/src/b4/man/b4.1
+++ b/src/b4/man/b4.1
@@ -101,7 +101,7 @@ the current directory as a .mbox file.
 .TP
 .B \fBb4 mbox \-m ~/Mail [msgid]\fP
 Download a thread from your ~/Mail folder and save it in the current
-directlry as a .mbox file.
+directly as a .mbox file.
 .TP
 .B \fBb4 mbox \-fo ~/Mail [public\-inbox\-url]\fP
 Download the thread from this public\-inbox server, and add it to your
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index 8deeb6c..6fd4b40 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -71,7 +71,7 @@ For options and their descriptions, see ``b4 mbox --help``.
 
 ``b4 mbox -m ~/Mail [msgid]``
   Download a thread from your ~/Mail folder and save it in the current
-  directlry as a .mbox file.
+  directly as a .mbox file.
 
 ``b4 mbox -fo ~/Mail [public-inbox-url]``
   Download the thread from this public-inbox server, and add it to your
-- 
2.55.0

