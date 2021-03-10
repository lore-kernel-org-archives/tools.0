Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800361
	for <tools@linux.kernel.org>; Wed, 10 Mar 2021 15:32:47 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id j3so13246807qtj.12
        for <tools@linux.kernel.org>; Wed, 10 Mar 2021 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=cVesAF70kKJ+7l+dJKWy5oyQkxUI685VEnSRl1R8F4k=;
        b=W5WNAdwkcj9y9ixdsRTAsjzUEPfQ2sB07c26p2aC/hhG+RELThY1EfyETvvoy13v/c
         ly4t9jtsTM6XuV7OMIT8qPBlTOB2BRt7izO7YHsbSr9ZfaBoBnSuFkkQUZgaKmok6MVH
         w/o6n6sgwPrLzppXxa6cvwrsVX0yIdoSag4bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=cVesAF70kKJ+7l+dJKWy5oyQkxUI685VEnSRl1R8F4k=;
        b=Tzrnont5f6xwnE9TmHYVMwBUBT5RlL9WMCtJ1wQMuatK/uRKnbyYyulqNPz3GRKaLG
         CCCgNTeaCrnhrQvo38Gq8+UEU4wjj1YJtSrFqS/dH9ZXV/97yCIgUltJqGiD0j0rwR5I
         /PAFyNytgG6iVYAqLm7wX+fma7VPYOt1iNIx4ErNzLy2XcRc0s2Ye52LNcs51BBtiCCg
         puP78zMkR9y05yJT+oLhMoOtRatMdTKgaZYIu/81PY7mC/IdIF61aLR4eF8MhxwJcvg7
         ia43iXTXByWYUU8muGkWilsNWk/WHX/P7eW3aIx0m/0DboGTo6A5ofOxcksysA6Eqqlw
         D9ZQ==
X-Gm-Message-State: AOAM531V9/9ewe0IdMCqFOlkZBvgIC4DGZt5JtzFbqwAEGFITPiP8tdk
	OpdNNuoDaFr+oQbGGvCwhpcsDfAApsb4Mq3I
X-Google-Smtp-Source: ABdhPJzYXMKwCXXwZkL6XiRFC7oX1haBTafekECRWBASch+xMWzJLTUnuhqiibVTZke/TcNNAWd0kw==
X-Received: by 2002:ac8:44ca:: with SMTP id b10mr3109924qto.293.1615390365722;
        Wed, 10 Mar 2021 07:32:45 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k138sm13085391qke.60.2021.03.10.07.32.44
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 07:32:44 -0800 (PST)
Date: Wed, 10 Mar 2021 10:32:43 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: This list is now archived on lore.kernel.org/tools
Message-ID: <20210310153243.tirn3oldfh2nlp3z@chatter.i7.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

A quick announcement (and replication test while I'm at it) that this list is
now available on https://lore.kernel.org/tools/. As opposed to the rest of
the lists there, the archiver isn't a regular subscriber to the list but
clones the underlying public-inbox repositories directly from
subspace.kernel.org.

It's possible that there are some kinks to be worked out in the process, but
it should eventually be much more reliable than what we have for other lists
-- messages should appear in the archive before they are even delivered to
subscribers.

Regards,
-K
