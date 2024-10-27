Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C958417C61
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730068506; cv=none; b=jdBsO+e1hy/R+Xoh+Ic2ZYubawvaoDgJO9dSJQWcqJK4z0xowFf4mSp7kjfdz/TnmMviMPD+tApxEMdv7E6To3pGwlv6j4P2piDZmRXnCnGEXFM7L9JMPJMWe1MiezxHdBCxIPX4f2tRcQ+z9opMV7g+JiK57JQCrg+rW0LCdb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730068506; c=relaxed/simple;
	bh=K+l16sqaq3lJf73NknBv3zEhSAGS6mixircG+nne7Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDd2NfTS52vMQ+DN0Siwrsf1XDj38xbuvPCqh0Nhhg06Co2dEhpqnKbnvS+q6PmmMowksY0s3KccoA2vN6qo2R0rst1YexYehUD/k18V8dwMSe6ayNZg6s2ZDPHezgxUVDFuIvGpDr1+GHKz9zlCQmueFRpnnxsy9QcTWUWSPeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYRp93C3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYRp93C3"
Received: by smtp.kernel.org (Postfix)
	id B4736C4CEE4; Sun, 27 Oct 2024 22:35:06 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D09C9C4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 22:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D09C9C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-83abcfb9f37so144514739f.1
        for <tools@kernel.org>; Sun, 27 Oct 2024 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730068505; x=1730673305; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9CiP9VlwuLskIhfXi//tZDR9ko36YCjXLZj3JRThY8=;
        b=QYRp93C37mJXBKk207NxoGsJuqWxhtlocbrU1OZCN1yl/DUaic4bzX/ErBcUVigQeo
         7vVIrcc/5HtJh/ui2G9wzmUI+SCcOgo1rJJkSWvsf/Y3NVJ8Q/WEX3HlZnqOeLAO/RAE
         UlCiN6by+s93DRB4/qGGvA/NosvXmTbPJfXWxfYIBlrGFrugFt0jjzSFQ/6OUQBn82bk
         EX/FVw9ikrPrxkjwmin1W96+4Rbu7qmJ+jFo2/bf9WJFZeH7EduPXL4mh/uZFgvLDwmd
         q2oqKGI8dFUGQvCKpUjW89aoqhvJ9oyb/0tfEbmcnhpwKhoqW73RdorTnKxsrmyQI61v
         ClNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730068505; x=1730673305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9CiP9VlwuLskIhfXi//tZDR9ko36YCjXLZj3JRThY8=;
        b=EzuSHzMLWumygz/fyHtT/ImBwOJQu8yaoIQTROpSGkCRJHkiunYVgjifMe5TAaC3Y+
         3aT8oHojVblvgScvxsrZf6DSv4wsnhVZVJZf5lKbCjghD9206QAphpWEX5IUMQs97q8o
         po2b7VWnV37a4qauekfo9Q8zppPVn9w948h4jzg6fqgpCYeooqafsdpFBDMsd2TTflx0
         oaEF2XVFtcxneF0ZNVOfANMV6i0k3fDWcBgopyGGa7fDHmH9C6xvQq7PmnX/1H+vU9Vr
         hjpvVAz+X1+EIHm5NrCZbKn7g6ZeRoh3j/4qM4T0iPy2abCGdiJ2Qj3IJAG38KdAA6On
         AzRw==
X-Gm-Message-State: AOJu0YzYY71iwlPC+r5CNsoZQFYYCo19aqucjUKRkx+XbrBSH0j1x1KL
	kLs6x9jpqm6t73OuLAumoiACIbZ0BElmpEDiGS9o/ZUY0qF1z6N3KZUuYGlY
X-Google-Smtp-Source: AGHT+IEEwWaWsEytN4o8rxiEnrBSrr1DDlnsLJOrWA6jXrHRm9Lb3utjnqwKkb/MMCynMVGj1dShnA==
X-Received: by 2002:a05:6e02:1c4e:b0:3a2:7651:9878 with SMTP id e9e14a558f8ab-3a4ed2aff10mr53521905ab.12.1730068504757;
        Sun, 27 Oct 2024 15:35:04 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a4e6de094dsm13518645ab.33.2024.10.27.15.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:35:04 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 17:34:57 -0500
Subject: [PATCH b4 v2 4/6] src/tests: test for trailers with improper
 formatting
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v2-4-e963f78b3ef8@gmail.com>
References: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v2-0-e963f78b3ef8@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Brandon Maier <brandon.maier@gmail.com>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.15-dev

Check that a trailer with an improperly formatted email address will
still parse to something usable.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 src/tests/samples/trailers-test-extinfo.txt | 1 +
 src/tests/test___init__.py                  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tests/samples/trailers-test-extinfo.txt b/src/tests/samples/trailers-test-extinfo.txt
index aa61e8d635923c2e2539b82c60f69b489ad7cee3..5417cdd87bfdf4ddb278e125a6dd04d2e86af141 100644
--- a/src/tests/samples/trailers-test-extinfo.txt
+++ b/src/tests/samples/trailers-test-extinfo.txt
@@ -4,6 +4,7 @@ Date: Tue, 30 Aug 2022 11:19:07 -0400
 
 This is a simple trailer parsing test.
 
+Reported-by: Some, One <somewhere@example.com>
 Reviewed-by: Bogus Bupkes <bogus@example.com>
 [for the parts that are bogus]
 Fixes: abcdef01234567890
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 7fe43b0158460f06d0a2b52d2689d26e7ef7f840..85ccd190677daebc30b9987eb811d44a15dce79b 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -62,7 +62,8 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', None),
       ]),
     ('trailers-test-extinfo',
-     [('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', '[for the parts that are bogus]'),
+     [('unknown', 'Reported-by', 'Some, One <somewhere@example.com>', None),
+      ('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', '[for the parts that are bogus]'),
       ('utility', 'Fixes', 'abcdef01234567890', None),
       ('person', 'Tested-by', 'Some Person <bogus2@example.com>', '           [this person visually indented theirs]'),
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', '  # initial submission'),

-- 
2.47.0

