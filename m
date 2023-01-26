Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6246BF
	for <tools@linux.kernel.org>; Thu, 26 Jan 2023 17:29:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id j9so1866147qtv.4
        for <tools@linux.kernel.org>; Thu, 26 Jan 2023 09:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JEQprLRH1oNnVgsDBx6iGqn7lTRT9reJZOtAcrRh+rs=;
        b=Hg6QqrBkMYnIzbsHDFBn2yT0pG7kOySctE/lJyaw4X5e15E4rkAIFc9obMvTrn4jP6
         9kiQ1IbXTJVlx29FR2EPsl9Y1RPChQuNtYslucq4tqXjpRYtNnIH6kTGkvk0NEohs8Xe
         PUX5lpRf2hMDDM3K6y/WMph4hybQarC14j1iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JEQprLRH1oNnVgsDBx6iGqn7lTRT9reJZOtAcrRh+rs=;
        b=wTvYrdrIgWv1GmAUQeqKXkcUAP5O6ecIjM8pitqavYJHgFgR+HWB7Mi6Fh75xpIXlP
         CALHQrNOabyU1HJZmAQoQ55iyurhtDG3bBOSXsOPRw2XpZo6mex2FI0Bs8nVmqFdMjD9
         Pio/VwgP5YX9t3SgzG+piBRes5srArcOIcc6r5DFeuoItMPMNGHFAKxaBZMYOOlH6Bq5
         lsigs7DMqcDkw1twYndnzcKMgCxrcwIP6vtH7E+hAUMMIviMPbm/XigwEGM2A//noo2k
         PuTwKVzKhAwKrbgQTk7RNZL0AUMS/+T24/oGQW9KotIVbKeFs/SyzKVWHFSzD4VCvG39
         +k6A==
X-Gm-Message-State: AFqh2krl5pJOaXifFPrijyE5r6xUEzzOJA1Hb0HDCPhq6JxEIBeV1Aa1
	GI8ULm3q0BRV5hdJoWhDMXoCyoe+KnhN2yWe
X-Google-Smtp-Source: AMrXdXuQOUnDxB97CVHQydP7JonKLiFnjdFs1qrIWeOCzSAQL/OetTW+mAA12IGFndZu6fit2oaILA==
X-Received: by 2002:ac8:5545:0:b0:3b6:2f0d:1925 with SMTP id o5-20020ac85545000000b003b62f0d1925mr51500751qtr.64.1674754141464;
        Thu, 26 Jan 2023 09:29:01 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id j7-20020a37b907000000b00706c1fc62desm1228452qkf.112.2023.01.26.09.29.00
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:29:01 -0800 (PST)
Date: Thu, 26 Jan 2023 12:28:59 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 0.12.1 available (python-3.8 compatibility fix)
Message-ID: <20230126172859.nwuf5vb7wb22jlfm@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Version 0.12.0 was broken on Python-3.8, so this is a bump release to address
that issue. There are no other changes.

Reported-by: Jon Cormier <jcormier@criticallink.com>

-K
