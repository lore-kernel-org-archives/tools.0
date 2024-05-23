Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143CD46AF
	for <tools@linux.kernel.org>; Thu, 23 May 2024 08:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454212; cv=none; b=IH9f/CsnyWsmwZLCj8lqedXhVsHpG66Z9vohZ8t4kJhQjkRzavUF2Y0zOSgQTGs/8xz+EZzlic+7SStGQelg46PEcsa4YdaQ5ffRdDphrvHdVgZkfmk3epmi7TYO5Sm1oR/bbfjsDzjwBrVXJk6R0xHs7RgHOwsXU3cxo90AgMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454212; c=relaxed/simple;
	bh=gxRixOnXu/pSFHYdwL9QsGYfzmmwzgFy3IPqdWqN6PY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D9WvGnkXi595kMvu69pFKsufnueoZISo6TdutuFvvxoFDzdLvR6W3Xwe3LnOPVk253b597VyZnt+YsbweOD5iTSISAeNkljVQLoKv6K3uCez60YaHdgTxmMwNx9e+jYhVc/59NxuQjBINym7oD6/7vaMlDejU/luPb9uvEbEJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=i3G36pku; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i3G36pku"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-420180b5838so36600545e9.2
        for <tools@linux.kernel.org>; Thu, 23 May 2024 01:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716454208; x=1717059008; darn=linux.kernel.org;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gxRixOnXu/pSFHYdwL9QsGYfzmmwzgFy3IPqdWqN6PY=;
        b=i3G36pkuao/nKlCONCydOYP5QslSYZGn3oxallXVTA9zAWbjRoSFJ7rr01bGxN5njM
         icH56DBiVwqD8wMnNKvHCX3dXTEO6GFcwym/mJTHVCNCPyQAjhCgGtNYOghlS7MwDv5P
         duXybs3vAPwbHIV4gY8l0DOscXnK+HuXl/vCpUmskMMUzLeFJHECiD97oBNvmRT5oDIz
         CNgO7PPPabDNY6M9FCMnovTt5imwld0eSnjEE/YH/WRj3fKiDj7T3srsSER318BsD0fp
         g0rTbNxj4MY7gufrTt1ncsKtAQ/tBxxfvAi19/637QwglpSgzgsDzGZwTZdM0dcs2+5N
         Dwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716454208; x=1717059008;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxRixOnXu/pSFHYdwL9QsGYfzmmwzgFy3IPqdWqN6PY=;
        b=rP+HVWn7z2mhv8T/vzrGK8fVpXcYtowQqBrEh8mQdeeJQugBsn/yb77w3nqCw9po/A
         EL1M/gPX6ZV0P6cAZ+k6MDtLGCNnFhMxYxZYeM6/8rlo2r7NbphkpHOl1gvLVmInYfaG
         YoSxzG1+6bT7cyF6spo2nBBQxzHQksm5+vEbqurotGf8/DqJv7hvxoYoq/1ZdGM8U18+
         tS4BtDexE10pZdKah8vMh2Z4A6Zgi1p/ZpRBr/SfWAfUvFXA6jOv+Q+W4lbF71ZI68H6
         8hmqZsvvyefgUCAf8CDe+jK6voJEhdjNzN01wFdoUhQw3ZjWJfxWefUe2/6uVGax3WjW
         g8Ew==
X-Gm-Message-State: AOJu0Yyb2v/K2toNl/TvvcfUqZm+pXdYFqjkLR52uJp1YqZ1qvXRM73G
	wRcYoMaAfPsASpxGH2ANfnItXh0+Z18lp50Mj/reJWLPVHN9LBVNecqbdLJ6YXM4LAA9qdvbrP2
	g8K0=
X-Google-Smtp-Source: AGHT+IEAlc016TMqPdKEwE2CyhM0KBkuoimPCgMz/jxmupu91UfldyevaBsijLe/1zqldGoRCMs82w==
X-Received: by 2002:a05:600c:4f84:b0:420:11e8:f20a with SMTP id 5b1f17b1804b1-420fd2fe99bmr45977435e9.10.1716454208394;
        Thu, 23 May 2024 01:50:08 -0700 (PDT)
Received: from localhost (lfbn-tou-1-402-59.w86-206.abo.wanadoo.fr. [86.206.229.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f15f66sm18684305e9.14.2024.05.23.01.50.07
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:50:08 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: tools@linux.kernel.org
Subject: b4 prep-perpatch-check-cmd conf via .b4-config
Date: Thu, 23 May 2024 10:50:05 +0200
Message-ID: <87sey8yksi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I'm yet another (very) happy user of b4.
Thank you for developping and maintaining it.

I've noticed that v0.14+ contains the new b4 prep --check command.

This can be customized via b4.prep-perpatch-check-cmd [1]
However, we cannot customize this via a project specific .b4-config [2]
file.

It would be useful to be able to customize this via .b4-config, for
example to invoke checkpatch.pl with additional arguments (on a
per-project basis).

For example, in U-Boot, I would have the following .b4-config:
[b4]
prep-perpatch-check-cmd = ./scripts/checkpatch.pl -q --terse --no-summary --mailback --u-boot --showfile

Looking at _setup_main_config(), I can see that wtglobs does not contain
'prep-*', but adding it seems not sufficient, probably due to multivals
parsing.

I don't have enough knowledge/time to dive deeper on this, but could we
consider adding support for configuring prep-perpatch-check-cmd in
.b4-config?

Thank you!
Mattijs

[1] https://b4.docs.kernel.org/en/latest/config.html#contributor-oriented-settings
[2] https://b4.docs.kernel.org/en/latest/config.html#per-project-defaults
