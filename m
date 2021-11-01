Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6E2C85
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 17:50:23 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id r8so3473696qkp.4
        for <tools@linux.kernel.org>; Mon, 01 Nov 2021 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Wxd9o2Asu7pxH0SN+ZqozXQbQc4IxMXRgAZ+3mlpo7w=;
        b=BwyhREI5iZrV79j2ZMvDd+rps+PnBL4hoauGL/FqKJ0fKFYjmZEAcIITDE02/uI/5k
         jh3goPJjjjvrHNdDJZPJJLsbH/MZv8+JggM8WW7tgyzldT28DNmOBGZ9SmA2v0a5F8mR
         6Dp3wzrAGwU91RycXn4ELa0QqCq0Y9AzzhlMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Wxd9o2Asu7pxH0SN+ZqozXQbQc4IxMXRgAZ+3mlpo7w=;
        b=gQlPZ+1EmIsl6hF9n7PeHyL7/WPZr/yYzfkTKk5LXgK9ypS1jE6raaFuzq99NZJKH1
         +6EOxj7iKFSfVM3sbqsdw7o+QTYQOpVUXD86PwoHgpNeOWwo2twdeddrh0bIRlCfz/Cr
         ETctBVqZ6ChDaPrS7/cEv7Lmt2BtK3BP7MYXR3Z0xdaqteBOio6jeD98sIr0QdEjg6Ql
         zYP49x+59Sh5jRFdnOW7XGrT5mwQVqL+/FmuF8AhM26rECuApwbwHMsXvFB7JOmrflk9
         HX0bd5tUHtBR7uscuZ+4lftluFv1TQyoWdNL0vuXhe10Aku9wxgwYWcCN/fvYiOHJUaV
         KW4w==
X-Gm-Message-State: AOAM533maKAfEVKVlpVOIjTii9n2jDutjGCwDJKjNKq/2qzrTCjSCbZH
	Dp34dgckUcX5z3k2NgrZ5sSpZoo5pYbF+Q==
X-Google-Smtp-Source: ABdhPJxfBCmYoNXulyhbtHaa/pleSWfoO6cPU5vF4B8yB4hbwemEYzzVYX9Lnq7HcnUWkjCvR/MukA==
X-Received: by 2002:a37:8044:: with SMTP id b65mr24279002qkd.295.1635789022079;
        Mon, 01 Nov 2021 10:50:22 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id c24sm11276385qkp.43.2021.11.01.10.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 10:50:21 -0700 (PDT)
Date: Mon, 1 Nov 2021 13:50:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4: unicode control characters -- warn or remove?
Message-ID: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Per exhibit a, what should we do in the situation where we discover unicode
control characters in an email?

1. Warn and strip these chars out, because they are extremely unlikely to be
   doing anything legitimate in the context of a patch (unless someone is
   sending patches for docs actually written in RTL languages)
2. Warn and error out, refusing to produce an mbox
3. Just warn and produce an mbox anyway

I'd normally do #3, but with many people piping things to git-am, I'm not sure
if it's the safest choice.

Exibit a: https://lwn.net/Articles/874546/

-K
