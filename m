Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE613D6E
	for <tools@linux.kernel.org>; Thu, 19 Jan 2023 20:56:04 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id x7so2565831qtv.13
        for <tools@linux.kernel.org>; Thu, 19 Jan 2023 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2BvmgJIKAIbDH0ikkoEQnF+Ut8h19rP+kP0l9pq+4Ic=;
        b=E49q2Nds9qbULI3Of60dObkoU1z7xX6k9L6ZZeZgZydlRE0l33Q3RF9WLWw2cVaiIQ
         H4NM2Kkjn2XIQYVL/rtDb4LeLpNjuFTZh8JxsjUlejbDnAHGgjw0Vr/tFCu6T7JXQO58
         sBmokKFg/xjjM73WcgTG/BVpAH/zohQJQrIUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2BvmgJIKAIbDH0ikkoEQnF+Ut8h19rP+kP0l9pq+4Ic=;
        b=IBRqM0M6ikSbo4qXUHjSL+o4gtRS4PHx8qjbaUSTW/1G4PGlYQ+NJRRPD72mi2j3h3
         XMwLwV4Vbh++yM3EJ7l1CNGetyCbkbm/TVUkdoKAewWXgnesZM4x99IlUxXPmQj1sda8
         Fk5qOlXUJn5kM7Dz0Ural8/A0UorUGbRrB/DWUMCLrIkVQQ/T4Q44PoNvbiG7ybTdG9t
         w8x33sS1GCPkXQLgebnMDAWd+2BuvI1uhKVE16FPPWLju3WF4PjgDccGKCzBSlIRxt2z
         DflvSviFDCZCmcrIpN/Z2UqIqCH0KMSRxVFAQpNtzw1JvV6dTtZXNf06vWFGFpegO6eW
         xchg==
X-Gm-Message-State: AFqh2kpG9qF7jybWOlzxD2Z0x2KhZ0tgtIANgYdCx+YhzMZOgvd6JUIA
	AzsVtEjwTFYdgDSkGtLSVnDjTDs3g8FXRe12
X-Google-Smtp-Source: AMrXdXtvC0ZJKy0muhZ+SClNCjHW6a+TeGUda8lnNkbYkACVyBpJzWY4lBFhMfxlY3ksMygQEbchnQ==
X-Received: by 2002:ac8:4a09:0:b0:3b6:5d23:8748 with SMTP id x9-20020ac84a09000000b003b65d238748mr8706570qtq.52.1674161763008;
        Thu, 19 Jan 2023 12:56:03 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id j19-20020a05620a411300b00704c1f4e756sm24546650qko.14.2023.01.19.12.56.02
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:56:02 -0800 (PST)
Date: Thu, 19 Jan 2023 15:56:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 send --hide-cover-to-cc now default
Message-ID: <20230119205601.wvfebidyugx2rhu5@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

The To/Cc trailer lists in cover letters tend to be pretty long, and I think
they visually interfere with the maintainers' work by requiring them to scroll
to see diffstats.

For this reason, b4 will now always hide the To: and Cc: trailers from
generated cover letters, which makes them more succinct and visually more
appealing.

This change is in master and will go into v0.12.

-K
