Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A716C87B
	for <tools@linux.kernel.org>; Mon,  5 Aug 2024 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722902219; cv=none; b=cGFPB2IwwuYJ6LPKUJVmWT8/jBwvU6xhsoyxLc/NL8PW07m9MZWzfLRhtPean1NPGx6ug4trRYPO2bJEOhXMliY4WE4m4d2FgH1SV9pJkjWpT0SzdB0WEYSkWVzRa4KIyBCfL6oDid83klRSMWRGI4txH3l0MyjrvQ9giEQMqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722902219; c=relaxed/simple;
	bh=l95SJIVaPCY47tJFX8X6AsS4lqdnPXep8SsFZ7bHidk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tvvP8yOmkckmAzzCQSldJQF1Sze6eji8pMoPaqFlW/jAiF89ORCLUcR6xatj6XFg4fCyA5AUkvvv2b8TKT2A025KHqN6elBlEolc6Guz3yniseq0tJPJYwGxZ0JxIjpb9R3B4XDdw/d3CpEGlcRSlEvKUgZ9SeJGTfbhUDbA4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YcEKxJDt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YcEKxJDt"
Received: by smtp.kernel.org (Postfix)
	id D6F9FC4AF0B; Mon,  5 Aug 2024 23:56:58 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80A8EC32782
	for <tools@kernel.org>; Mon,  5 Aug 2024 23:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80A8EC32782
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd66cddd4dso2180535ad.2
        for <tools@kernel.org>; Mon, 05 Aug 2024 16:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722902215; x=1723507015; darn=kernel.org;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nNMnCFaIUOjhChAiUv1sN3FrfoWTL1t3z1N7bZayuhM=;
        b=YcEKxJDt3PIh2s4Whw1vhrRV8C+IEi4INuzSkcqS1Z0CMLL+5WuhtEvQghrbvKiyXj
         Z3/t/qlncPDOm+gmshpk0SUOabhH4IBCjwLBqmGIB7P8UgBLbfQBzj39IVItKC7PU/cU
         cgl5LbGUaVBBJgeoKCJGde/cu4HEM6f38WkzRHti4gq4wz2cm2BLv1Nj4czBGXxhYm+s
         DYDqy+mEMdycUoR5Xb3pYnQD6gU0E/XfEhyF3U4k0//3gTHrVakqCTBYx93vTr0zJfz5
         yYepExTuZh8StxyGYepMRKfr7QPgXq3Mc7S0Qxjp6UvPLgIkStVD05Gn+J4boWh5dDsi
         iNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722902215; x=1723507015;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNMnCFaIUOjhChAiUv1sN3FrfoWTL1t3z1N7bZayuhM=;
        b=p+vkn1f2ZSSHnW+fWmLfqtaUHmE4g4oWL9/KypFflZeiNVDHDfoQgHrstGTwrxo26l
         mxmDOcBlI+oJREOcEzZJU6wyY6OJUF/5GIN36LafMmSyx203lL2uTFRMp1kfJKzsg0I7
         eON/+mS30Zo+0Wd/6ClALl+0o6MllhGyW/T0N1RNCy9xHESqve0hAv/BTjueRg6GNUJM
         3O7RW0oeE1fskM2Ex4pmY3YuJ8znGjT6Pig8hyU0WKjsKPlPaFKU9mmRCH9Ppbff8zXn
         c35ZjvDVSEQKShaUatBfw7oKdWgesldlZnThb0GxuKxl6aD2Yrcd+s0Uqkkc7WvkjbZX
         sbqQ==
X-Gm-Message-State: AOJu0Yy1xNbZWKDJ8V1wmg/miqfJGvY9SNhVRmWYPyJSBGDV16ZT8JEZ
	HmTXq8Tt6Tl7PU2rn4wesSdwYQJ66OEpU3DdjskADKA8C9k9JyGeFdtSMuuQhJt8Hi/Qq53cOtl
	FQBg=
X-Google-Smtp-Source: AGHT+IF6UthK1dtEcQS7WnNoAcZme+YO+7QKYh/81nab7zQ60OOCvmTFZ20Aas8N8vq0q2VImMn0xg==
X-Received: by 2002:a17:902:e743:b0:1ff:5150:911d with SMTP id d9443c01a7336-1ff574a2318mr181069275ad.60.1722902215415;
        Mon, 05 Aug 2024 16:56:55 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b54bdsm74173425ad.293.2024.08.05.16.56.55
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 16:56:55 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tools@kernel.org
Subject: b4: message-id from deps added to cc list?
Date: Mon, 05 Aug 2024 16:56:54 -0700
Message-ID: <7hh6by34mx.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

I've been happily using b4 for awhile to collect and apply patches
locally, but finally starting using it to manage & send patches.

First, thank you for all the work on b4.  It's a major improvment to my
workflow!

I'm using b4 from the stable-0.14.y branch, and I noticed one pecuilar
thing on the series I just sent[1], and that is the message-id I put in
the deps (using `b4 prep --edit-deps`) correctly showed up as
prerequisite-message-id, but for some reason, it also ended up in the Cc
list, leading to bounces for all mails in the thread.

I double-checked managed cover letter (using `b4 prep --edit-cover`) and
it is definitely *not* listed as a Cc.

Looking back, I do see it in the Cc list when I `b4 send --dry-run` but
I didn't notice it before sending. :(

How is that getting into the cc list?  Is it grabbing this part of the
cover letter:

> This series depends on the support for the new TI SCI APIs here:
> https://lore.kernel.org/r/20240801195422.2296347-1-msp@baylibre.com

and assuming that's an email address and automatically adding it to the
cc list?

Thanks,

Kevin

[1] https://lore.kernel.org/linux-pm/20240805-lpm-v6-10-constraints-pmdomain-v1-0-d186b68ded4c@baylibre.com
