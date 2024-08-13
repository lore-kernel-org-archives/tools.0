Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C51ABED2
	for <tools@linux.kernel.org>; Tue, 13 Aug 2024 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723589895; cv=none; b=pyU0c8gGtV09r4dj9Bf/FF2wm21SODmNTkYi31Rv6YMk6bK9t4nnaGcpKSpZR8jENQBXuERTr0cbWiAvy3A+q+t6XVaoKhP5I88TIjcoCR/k35FmJmxmQsCVuc9yZnsYsS0ck5IVwcEIqH6SG8OaShQopyu6vx3NGEtzG/5cpM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723589895; c=relaxed/simple;
	bh=VEVZsfVG0BoTBnzlPmfOLm6OeqJHSBAcamfrXnuV204=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m2ZbqucqC8CxMi9145v/KXShdP3Q+5rsX8rQduIPBUfU3mYJW6K651pjfouQanc0at0YKx+tq9Pz3Oc/1q8wh/Scw4PE8Np0pbXaUibMnyN1+ddtufYhbM8+gdSy0Gqmu07KE7BcqQOKC7YYf3M3bh7/TbWtG+gkbKIPjYPE4vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Cqh6dNF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Cqh6dNF+"
Received: by smtp.kernel.org (Postfix)
	id 85A76C4AF10; Tue, 13 Aug 2024 22:58:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E37EC32782
	for <tools@kernel.org>; Tue, 13 Aug 2024 22:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E37EC32782
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-710ce81bf7dso3943284b3a.0
        for <tools@kernel.org>; Tue, 13 Aug 2024 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723589891; x=1724194691; darn=kernel.org;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VEVZsfVG0BoTBnzlPmfOLm6OeqJHSBAcamfrXnuV204=;
        b=Cqh6dNF+2YvfMLRR+zox6luPii3yZIBu2ba4Z0LIgzThCl3161pdGvXkg3FyHtZfHs
         5K2iMf9n1TKPjzoyn9KQBg0NTSlPvZMybzBPoqanu6fmFjSVqnoubzP/+IokDLt2VkLi
         Q4wnKMB+FpRE6um34I8wIOI7IE21JS5OdUfdVYkWpA7/YgAp6elcvzYsh/RJf8T5ylpW
         BuHdINYcQSAPznBG9Eh+rXhYI12hbWt7mo/0J2f/58aWOfS9TQWSMs+/r9XBOdV5gxam
         9ApVm1JhvhVnFjy19WUvshAaCmojqjSreP+bDsH438xGIWvnTAOwyrukOkTRgOpKgv3L
         s/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723589891; x=1724194691;
        h=mime-version:message-id:date:subject:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEVZsfVG0BoTBnzlPmfOLm6OeqJHSBAcamfrXnuV204=;
        b=Dm1ebpqohONF2Wpdm+aSTLo1MLjx3NjP5Rb+eki3R1YnZrBlMRsLYR9OwRwPwtiMCJ
         p7/36T3lW3W7dcBCcZEVNl6v+jlBlefi9jw+bfNk9o7LMV39BaPz6tjtG2Ya46GuT1FW
         5I6pb7qYWqSPWyUQLDm7F1NT2IQgKPX85gOilwV05MkSUenV3hKnP5aU8U08wAAwsoI5
         Q6KE6famsivxheknKtVWCz0aK05+Gr3FB88LRz3VJQxLu9n+4kbePHjzesK5PRU3HlYE
         XySCK43366R28ZoflqNiru5DPx9110wugBtx+XFu72J5RdFA4ltUqSPX1H32spHthrfq
         ZwvQ==
X-Gm-Message-State: AOJu0Yy94FDUgEZj1CdirMa8/hzL4wfC83I9EeI9o8TytmKdrlHGujLL
	ZjuXtySGZu452UbT9hewaQn6ECll4vOFS18h092l3KEP/a5ElBxn4pLXEWJZbsIe1DJr1rL98Ni
	d
X-Google-Smtp-Source: AGHT+IGAzaTaFHspWrSP/zSmyk40xu2c5SCLxDhBDM+P7FXTk782zhWh6a7XCg+h5NALw2oyAQD6+g==
X-Received: by 2002:aa7:9385:0:b0:70d:311b:8582 with SMTP id d2e1a72fcca58-7126710d191mr1093830b3a.9.1723589890969;
        Tue, 13 Aug 2024 15:58:10 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5ab565fsm6222330b3a.191.2024.08.13.15.58.10
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 15:58:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tools@kernel.org
Subject: b4 send: how to selectively suppress Cc?
Date: Tue, 13 Aug 2024 15:58:10 -0700
Message-ID: <7hmslgni7x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

How do I pursuade b4 send to selectively *not* send emails to some of
the emails it finds in to/from/sob etc?

e.g. due to job changes, there's an email address I know is going to
bounce, but b4 send is still finding it and adding it to the Cc list.

Right now the only way I'm finding to do this is to use
--no-trailer-to-cc and then manually list all the emails I actually want
with --to and --cc

If there's not an existing way to do this, might be nice to be able to
add a Suppress-Cc: to the cover letter along with the other To:/Cc:
fields there?

Thanks,

Kevin
