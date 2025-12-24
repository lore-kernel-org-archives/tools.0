Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B6D2ECEA3
	for <tools@linux.kernel.org>; Wed, 24 Dec 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766594680; cv=none; b=MjhWzAd5Yd71pCspxbSS8Suz6BiUnbWv1+gqZoT5Nk2XsA9GolEwqyY2YsfO37Za1FQxNz+YVtJoVJmVEwwJxZS7ciuTUdq8vtNiuFruinOEKQHR3B6evZmHZ78Adu78umJh8Zo1zwcD29XT/zN9juXQfj7k66Uy0uK+4bgdyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766594680; c=relaxed/simple;
	bh=0OrbPTUxABm66uuijyTYpfcXbtt/Gvu3TBIxbBq0jcQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=soC6Zkra/js0xuMrhC8w5VdRh7Px8QctrPVsrMLl2zLQ+TiMVHAVrN0rQ552CD2x5e4jIEgq/mygDjolnmDKgCNCya/cfc1gch/Q0xAZBELIeWEm7BMyVNoX2uG29p/r8SnMzPmh+sxpLu9YKi2ynlabstZnXVD+NTZfhNImumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M5TLMXIc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M5TLMXIc"
Received: by smtp.kernel.org (Postfix)
	id B0860C4CEFB; Wed, 24 Dec 2025 16:44:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2B4FEC4CEF7
	for <tools@kernel.org>; Wed, 24 Dec 2025 16:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2B4FEC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766594677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=po5Kx8aNG4MbKezOiPsE9etT2Gg8E01HhoOT5asnohw=;
	b=M5TLMXIcT1KpOumrYClKF9qz3k77JkySGls8frNuqdpmPzBp7N1tONDJvLIUdeu6GtFmPq
	XN0wqs3wD3Mk5qV/B8ivtzOzXtCprRgcvZSvYnEqAKYU3L+Y6SmZD3XwyjmqaA5SX9ZsAT
	/jGKROvyCZQUOC/YRo5gUxTEJBmz3bE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-XJEY4eSHPJilzbc3-E5esA-1; Wed, 24 Dec 2025 11:44:35 -0500
X-MC-Unique: XJEY4eSHPJilzbc3-E5esA-1
X-Mimecast-MFC-AGG-ID: XJEY4eSHPJilzbc3-E5esA_1766594674
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso8405885e9.2
        for <tools@kernel.org>; Wed, 24 Dec 2025 08:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766594674; x=1767199474;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po5Kx8aNG4MbKezOiPsE9etT2Gg8E01HhoOT5asnohw=;
        b=GvioTJWZrzL402QuD7mAqVSOB2pYBlVmLVbaJypJuo66ZY8Iv9KK2lL/zfvOppU/Sr
         twKgsb0IKUcOI5kxH6be1++F4G3YNDomsdpMwX0XPUUsTknEKWmKEpEqLgdG9taij0zh
         ftGbx7KAE4WbObJnT5/j1Wbl81bHZpKVenvgH6sQn/guJsGjL15JjFOEGoYrrZesj8Oi
         qnOJRHqRV32iy8gAcZbUMMaY+w9Cw7mzXLp6UfFW8D0+Ugstqg+piizBeCkNlwTJl2Ij
         zR+c7VKqURwfT7GCaDZ/TnXvmO3fI6R0PKjyTjFk81CuXbwFpJkN7A65za5HSQrW5Zk/
         P52A==
X-Gm-Message-State: AOJu0YyJYa3FCO7030PilP7n+UOltFMbvJPzqMpWGx7ZYthm3uPzpufq
	jnWmL+tRJskRndMNRoHgX2xdCLeIVm0wVTL2ih13SBT4/vzwL6/p7/7+zZ+LFM0Bvf1ddtT2h66
	knn2fXxAAHGuaJJ+wZTlgLy0CpYZH1DVo1mqaFoblSkb88NjcDnIjVrmpx1mGlcpbVFjZvnWl+w
	snWQ+PYT5TKyTLCYlr1cdSUWPy9BnAeSbj
X-Gm-Gg: AY/fxX5ey0g1zMrpzIyRi6WrCywYHAiOy4YUze6e4R7rc89UqXlda/aXgOO8oJUW6Bk
	C2XvlMihfnY7RHKnIoJSc2rhONhElY7Ks/xGTBhRHmxSGQyxnHlOO7PldGmti40IJ4Jjam9XJx6
	gXnJLGNoJ0tMaoU14kqjyAMjJOJN17R6Dieb8a0dTO1ABzRlIy2PcaNKxcqvzs2mVrpcG1d2hE4
	Jg3jYvZEAzgXM1bFss9tLvuqiKF8/LQJ5eRWz8CnVTbfMhBXLC6bxagZNsypk6I/iZ6lCQ8Hg3n
	HdOdckLsMIiuLc10o9dBp4VvnX/MUZ+GYmctPVExe2PeA0haG3LrreAER15MVUL7zCHIn3e9ZdI
	3
X-Received: by 2002:a05:600c:350c:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47d19584900mr159620015e9.20.1766594674243;
        Wed, 24 Dec 2025 08:44:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnK/SXzD1wljNfHt/ENYWkEg8RnN+HCNoXaffcj4++yf6BMpPJfWWQSf0peeI5JjJpy+rSBg==
X-Received: by 2002:a05:600c:350c:b0:477:7658:572a with SMTP id 5b1f17b1804b1-47d19584900mr159619815e9.20.1766594673567;
        Wed, 24 Dec 2025 08:44:33 -0800 (PST)
Received: from redhat.com ([31.187.78.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm320115355e9.14.2025.12.24.08.44.32
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:44:33 -0800 (PST)
Date: Wed, 24 Dec 2025 11:44:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: tools@kernel.org
Subject: [PATCH] ez: remove trailing whitespace
Message-ID: <d5f3b8dc35ff5f13dd4facdb60214737b38d2feb.1766594596.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _9wCxeksDrXFTcsFF31jvrmHrdCUfMQCVLa24r1IM0c_1766594674
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove trailing whitespace added in presubject support.

Fixes: d7232f5db2e4 ("Add support for setting a presubject")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Found by chance as I was working on an unrelated change.

 src/b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 298e382..773df49 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1942,7 +1942,7 @@ def cmd_send(cmdargs: argparse.Namespace) -> None:
         presubject = tracking['series'].get('presubject', None)
 
         try:
-            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision, 
+            todests, ccdests, patches = get_sent_tag_as_patches(tagname, revision=revision,
                                                                 presubject=presubject)
         except RuntimeError as ex:
             logger.critical('CRITICAL: Failed to convert tag to patches: %s', ex)
-- 
MST

