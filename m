Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FE566C
	for <tools@linux.kernel.org>; Mon,  6 Mar 2023 18:02:37 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id r16so9901454qtx.9
        for <tools@linux.kernel.org>; Mon, 06 Mar 2023 10:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678125756;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po6fYRP9ERbJY4QGDsf0p33v3XMUo8HQfKBixalu14o=;
        b=N4rrLZEEDxY3VM6iy5xk48V/ZMBk96j94WwaMWmJLRqbOeKdsDwvWOM6abR64fnqSh
         +olozno+jcyeHpLQhyQEqSctCSRqvppIVYW4mwmklMYKWX4QRwBG8fqB5kmUZmiJmqny
         zGretDFtX+uoNHkOxlcOebYReMF2SalKmelFl0VTzdDVaD7xllI97zmD5VZFn/LyS44B
         7x9ZiGtOJM4Vvir+V4frBAgcUuCfeaXIfHrVQ6E+GdlrR+9eRtnn1AXCkU0RG8vp/5NW
         rv1bsHpepuCHL4VlcUbwGo/Z98VLiA5yHMxxK/eKtLeL8S8Lii9jw9xNoWfA8zsxCNw9
         gTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125756;
        h=cc:to:references:in-reply-to:content-transfer-encoding:mime-version
         :message-id:date:subject:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Po6fYRP9ERbJY4QGDsf0p33v3XMUo8HQfKBixalu14o=;
        b=EOhtKs2QWhQCd9kpM8lkSuj+V6Amsg1QKpMfhFaom+SwZ8wevcSZS3Waepw0iIjaCr
         bjESL6b3c/g7DeCgMc5RluV0EV7A0DNiI3v7o4HZ7tu7GBwe0lNkzMzN3lFoyEwSgrVq
         a9B0Hc5fcP8CnSdNsliKYUdZh3/f1JhP5Ft1veUx8irTUkImTwi8xbiYhzZKoK5+z0PR
         ouGQRHLimUoEWaXJPMd1+yvLvjoaUIUhQbRBRQrYAXkAMsdEZbmGUwBJy4jY10/gOmA5
         IH464sh4rGMXD76OxufLbofjUJ25eJkHGmfytnmG4qdXDbSKvAiFACRLvdhIS2L5RepD
         sP0g==
X-Gm-Message-State: AO0yUKVHecGSA9Y+wbHBkXil8/WwZ4kbD+0aL45YnZMCdpS5lrWaHtAt
	A7OojNVrZBwR4TKnT6PUpbw=
X-Google-Smtp-Source: AK7set9K2Bd+BQN3iAkk9Wp5rFHsFHKfRGpqNEluDtVhSFSQmZ0zN+RntKXRaeo87zFfzLWtCFFlOw==
X-Received: by 2002:ac8:7f84:0:b0:3bf:d9ee:8822 with SMTP id z4-20020ac87f84000000b003bfd9ee8822mr18839465qtj.36.1678125756606;
        Mon, 06 Mar 2023 10:02:36 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor132.cmc.ec.gc.ca. [205.211.133.132])
        by smtp.gmail.com with ESMTPSA id d24-20020ac800d8000000b003bfaf01af24sm8050763qtg.46.2023.03.06.10.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:02:36 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [PATCH v2 0/4] ez: allow remote-tracking branches as ENROLL_BASE
Date: Mon, 06 Mar 2023 13:02:08 -0500
Message-Id: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKAqBmQC/42OwQ6CMBBEf4X07CqtJIgn/8N42C4LNKHUdCvGE
 P7dgj/gaTKTl5lZlHB0LOpaLCry7MSFKRtzKBQNOPUMrs1emdKcS6MbwHEMb4jsQ2KwEScaWAA
 FLAqDJmrZ1pXuSlK5Yw9/1NbyekqKjP7kURLHjRicpBA/+4FZZ7n/uzVr0ICaurqpLtYQ3XqPb
 jxS8OqxrusXNuzyTdwAAAA=
In-Reply-To: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
References: <20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-10ee4

This is a more complete take at allowing remote-tracking branches
as ENROLL_BASE in 'b4 prep --enroll'. The first commit is unchanged.

Changes in v2:
- New patch to also check remote-tracking branches when ENROLL_BASE is
  not a branch (2/4)
- New patches (3/4-4/4) to support '@{u}'
- Rebased on master
- Link to v1: https://msgid.link/20230219-allow-remote-branches-as-base-v1-1-a1cf7948b2cc@gmail.com

---
Philippe Blain (4):
      ez: allow remote-tracking branches as ENROLL_BASE
      ez: also check remote-tracking branches when ENROLL_BASE is not a branch
      ez: allow '@{upstream}' as ENROLL_BASE
      ez: let ENROLL_BASE default to '@{upstream}'

 b4/__init__.py |  4 +++-
 b4/command.py  |  4 ++--
 b4/ez.py       | 15 ++++++++++++---
 3 files changed, 17 insertions(+), 6 deletions(-)
---
base-commit: bd1bf7905f2f9c2340b75b5074285105a6fa35f3
change-id: 20230219-allow-remote-branches-as-base-1ccdeb741f0c
--
b4 

