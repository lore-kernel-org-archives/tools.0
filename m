Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CAD27713
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 16:51:57 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id r15so10798234qvm.6
        for <tools@linux.kernel.org>; Tue, 06 Dec 2022 08:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yF7Bm1d3jhxG/xZET5IK69LOXpGvua8j7Zl/D/MN/qI=;
        b=hZfQqEBdgsHEdoragD85+9ONd5Wkcyo/4cx0CFq4LQP0Y/B4ZrdkPpQ6tgvIG45Ohf
         jecx2DBgXXW0lTyi77/h61sfQX4ZoPTkuvvPpJRwXne09Qu142ZGZB1mUbTkZ1h0FMSV
         wZiQziLPv+V4HcRAMQgmN2sSIH8eb8CDXQ8ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yF7Bm1d3jhxG/xZET5IK69LOXpGvua8j7Zl/D/MN/qI=;
        b=lG+axBYs6RTgOrpNy95Krq2m2yr6H1E1Szt+GaPnMMb6L7FI0C9aGEO31jDPaH/6Tz
         uAooHnOPF0K6B7EgTnzCwOX4tg2gEc4u0bljvQvmfULvC74IFve8JWNI9NtcRznGvjWB
         Y8KVBEwH74H79qgK3YEmJfAY48Xu/ji2R2MuPTh7u24YhEbI4YPX2rNWLovNxPU4uMd4
         898tFuPs0SCJ+zfz7VALYQVjMVFxSaZemR5TDjYUNEZNOap9c7uGyZNVLB43k17kmid6
         BTYb7zB8kSzvcBD63bKOIVEvpE4sgPZciUgeVex6r9yc0YFsvDken4fF5EPmYETkM6BJ
         bwHA==
X-Gm-Message-State: ANoB5pmTsDlSk8HcsAxydaU1kXsWiW+5EwKZi5+42iemXv7no+dAC7Xu
	dqBhuCFnijlUOQcWcmQKaMSmWjTn+DH5DtDL
X-Google-Smtp-Source: AA0mqf4Y+hX2AoXSgA9BaCLWs7uklNt0idr11Rh7pn7I2S21zdmR/9wIL7cUQp701g7cj4bl+Vqkwg==
X-Received: by 2002:a05:6214:2d42:b0:4c7:2d0e:79d4 with SMTP id na2-20020a0562142d4200b004c72d0e79d4mr21374072qvb.70.1670345515921;
        Tue, 06 Dec 2022 08:51:55 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a425100b006eef13ef4c8sm15624402qko.94.2022.12.06.08.51.55
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 08:51:55 -0800 (PST)
Date: Tue, 6 Dec 2022 11:51:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 change: "send --prefixes" is now "prep --set-prefixes"
Message-ID: <20221206165154.obuthhlgnkvwju4w@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

The previous way of dealing with extra subject line prefixes was to append
them during the "b4 send" stage:

    b4 send --prefixes RFC

I realized that some subsystems require more permanent prefixes, such as
[PATCH netdev] or [PATCH bpf], and it was too easy to forget to add them each
time the "send" command was invoked. For this reason, I'm making the prefixes
"sticky" across revisions.

For example, if you want to send an RFC patch series to netdev:

    b4 prep --set-prefixes RFC netdev

To remove the RFC prefix once you're ready for it:

    b4 prep --set-prefixes netdev

To remove all prefixes:

    b4 prep --set-prefixes ''

In addition to the "--set-prefixes" command, these extra prefixes can also be
added to the cover letter subject line (and edited via "b4 prep --edit-cover"):

    [RFC netdev] Cover letter subject line

    Cover letter body.
    ---
    Changes in v2:
    ...

This change will be in the 0.11 version of b4, which will probably be released
later today or tomorrow.

-K
