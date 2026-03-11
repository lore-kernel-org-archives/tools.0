Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD83B2FE2
	for <tools@linux.kernel.org>; Wed, 11 Mar 2026 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773214821; cv=none; b=BlvPmIGIMt/ltpsQK0+CIGAMhj9pzEWGmomZlws8ke6/kINYnG+G++ILcLRAF/cg5p43JNJybcf27i/BVjDEdReOV8Iep6qUOHt0k/L4VOGqca0GC7RUmD7CLCGFGdny2yiwp6xxulQbE3mJbPhugtX6N/qH75HATMXGKi9g0Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773214821; c=relaxed/simple;
	bh=Tn875eSAMGzFdl0FGDb0oQEd8uXQcfDpHgJ1iPYbUpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J2ueTSbzbz7l6LLPblkWeDIHJNYXI3RsKNaXIwn9kDzm+R0zUxHFOv6n+U+pQFBhf7HTke6NQduPg0FzTl34nnR0kQESmRJzt6pKvjgfPBVfspjY2uE5LvUQHkDTdH7YsrGF2jeKnSYg01KI8L0v25rynJ9bXeDe54hXl37HREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=b48RfZ7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="b48RfZ7g"
Received: by smtp.kernel.org (Postfix)
	id 15695C4CEF7; Wed, 11 Mar 2026 07:40:21 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C404C2BC86
	for <tools@kernel.org>; Wed, 11 Mar 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C404C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50917417efbso5820351cf.0
        for <tools@kernel.org>; Wed, 11 Mar 2026 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1773214819; x=1773819619; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZhsndzNY/o5tKeSaSLwx1YoHC64cidQfqzZPOV3y/Y=;
        b=b48RfZ7gVpVJlaFM4DHQAwkngRRGXQ9Ktq2cg9GypN4iSSIP48SEnH54LsZNugbGo8
         1opFhoiBRJbkZuw5zYoovbSxUErMqwq4ONqbbJdvhNpoRftYcTySHT13sPYsPJlhBbqT
         BpUPQbnJG9iQT/GlOno8sQKpzJ49CDBZhqP6oBujW9H7MIpmJBFVxAqCV5EljgNW08PJ
         BdVA1WfvzQHAtPoUDIkc1X7qbrNcChZxymUHJK4qYRrVTGGVlS8D6/Cziwu4Aj56bf7n
         0JyV+lkfnY4ai3QbtP+Tm8ykUuTqz7gIan4+PCE5ZTRrNbAIk5e+UF5ey+D24tKxcHy1
         uzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773214819; x=1773819619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZhsndzNY/o5tKeSaSLwx1YoHC64cidQfqzZPOV3y/Y=;
        b=Uu/mRpyYSOkBRkxIxdSYHLwH+uL5Ud0MOEd0T0jA/8JWvZ7zJeW/b1DysS72btrE8t
         Hm5w80mgv1/puk1fcJo1C8xjorpChXXBpF0fnJUzDF+HNXqSOm7JS5MQMGHt9hK5qoBH
         HDog7l04Z366o4XhnCal4qFm6gigMTTQtlwCTUPtLiAQ/TnkUgPra1e4sPLUg4QAgTmC
         MeHIdvymk8R0q0MbPxWFpEPCIjYogp6q6A8mGtMvDfYFR4LzbnF0Cxku9Mx3jjqjNa6a
         isN5sQdI0pzaUxYdaz4qgZ+IvQ9601K5j928iKdzbiz5YziZuAMrLfrjdmKqhcuyBKZn
         OHpA==
X-Forwarded-Encrypted: i=1; AJvYcCVJGdB0u7tuMo6MGM6rPA06B7PlabAQfMgbO+Q21s9yHX35WM5jUeW3O8/3gBSwopPJUWvxvg==@kernel.org
X-Gm-Message-State: AOJu0Yzc6NGpRjeIlkV2EJLjy8HiHGdo/OfWVVzkdawYWRzhAQsbchKm
	H3WilsSJggBtW81zmxqHSLwF4MDuTBqVKTR1eQ+SEI/QB6RHSLWIpqPZlD+vF3bOSEPBzwlD9i7
	EMpKq5wA=
X-Gm-Gg: ATEYQzz4tqZxoiGVhY1zYiXjdXAKYVXXAFt8Q9Ij0roHbmv/r+YdbQf291choCtZt2n
	ZYWWRm6NxaJ6dMAOh3U3+1cqCXAX2bHI7lZCGfABLPjQwILdfrdps+FON5eaq4opklgc2MgMx8V
	TI4l592hnT1tvJKsf3gnwVBtmDrKvuPGFpiq8VfyTJP8PWoowF5aIJBH47SsPuOhA6wG0I8JFn/
	EuHwM0F133Ynv5Sy8a3I5+bEbfkDD9pKhJQt88VBIi14aZ7+MgAFRitk7G2gYQm1APhsuCHdNyr
	VKkYtQxstlcoYH5tRyLZh4jTiL7VTo8Y3raB3LL7NLTSl3aPLB5GkToNT3vAC/NDKPBSX+rDyuK
	Vc2lxwJBd88Wa/2YRgd+iRmSTxOC9RlNTFF991iGAel6XMBvPpS61ZifWi460d3rB7anseePsLT
	aT10HP4AeR9gT1BBFAYmT4R6S49r7l9ZU+apLqyxVsy84rwmcVIS2HFCh7DLXQ8w9zGO6CFH9dm
	40dnXSaHRadJ3M3nQ==
X-Received: by 2002:a05:622a:1111:b0:509:1be4:97d1 with SMTP id d75a77b69052e-5093a19d134mr15507381cf.34.1773214819149;
        Wed, 11 Mar 2026 00:40:19 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([2605:fb40:0:c09:323a:5679:3782:80b8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509400d018csm2328051cf.24.2026.03.11.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:40:18 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: konstantin@linuxfoundation.org,
	tools@kernel.org
Cc: me@brighamcampbell.com
Subject: [PATCH] Fix typo in maintainer docs
Date: Wed, 11 Mar 2026 01:40:14 -0600
Message-ID: <20260311074014.289088-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a minor typo in the documentation for `b4 review`.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

Unrelated, but thanks for your work on b4, Konstantin. It's been a
wonderful help to me so far. I expect the new review functionalities to
be very useful for reviewing many patches from kernel mentees.

 docs/maintainer/review.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 4af5f77..9b6a32d 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -23,7 +23,7 @@ Getting started
 
 Enrolling a repository
 ~~~~~~~~~~~~~~~~~~~~~~
-Before you can track series, you need to enrol the repository::
+Before you can track series, you need to enroll the repository::
 
     b4 review enroll [path] [-i identifier]
 

base-commit: cba5b5a9fd6078646a58531643e7365480504d77
-- 
2.52.0

