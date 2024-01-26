Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB921F606
	for <tools@linux.kernel.org>; Fri, 26 Jan 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259123; cv=none; b=UzOCChTCptX3kNFhuDklYafUo078hoGegPqLlS/vIcaZqg4nGj8UEukIlTP5yqOTwJ1UvuddPEmqOW8VWp60UHj19WPJxp/fwVVSV/cPhb8/lI0vHjGme71GKTyV7V8s5Gs1yj/UUfAjzkTu2eIza1Ze3BH/n9aUS+alI3ZIMb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259123; c=relaxed/simple;
	bh=0BPFj/7E9Jlizx4RqyLQeDu3ANLK8YNgbpflG/IoTFM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=mWw5hgxRzdPCEPu3jEP9/gj5okzJnJ+o4we2DyS79XJZfd+OdaklxivBc4J8rwyx53Hd1xQqx21XQqYPgyeRvDEjZwMJLa4HNGCk5esA/beHeVGshBHFgnWPItttxGXyvOeVU9FvOrLdXw8TnrvijOQ4kqAzHYacAFXNcuxPiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E4jf+U2m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E4jf+U2m"
Received: by smtp.kernel.org (Postfix)
	id 0A2B6C43394; Fri, 26 Jan 2024 08:52:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52665C433C7
	for <tools@kernel.org>; Fri, 26 Jan 2024 08:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52665C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ad3ee50e4so185247f8f.3
        for <tools@kernel.org>; Fri, 26 Jan 2024 00:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706259114; x=1706863914; darn=kernel.org;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5AAsay6jB22qaSzogrkHIkA3rFjXEVcnbYZR8yiHsEw=;
        b=E4jf+U2meuAwm63m+uQesOmfXUfp7o8K4L6EiItLkyy64fNmo2LdgwJ0hfpmRhUxNw
         EP6c1cuNBITJMb/t8sgzDNMF9ELeRjeKRBxBWXK9mSjSnmkflYap5smuMNf0x6h9Jsfl
         evU6ZVUT92oWUs3oPSkYjNC/gHJT3lteeCLXPwpjcbrC84yGsBqIXW3EVgR8Y1WlN3Yc
         bwoz9ztQkcF7XfXYpqGjvXXD9UlkHVrHBokGiqBp4RhHpEjjgcv6kMmSNl3+QRKjXeut
         aYr9XXvqsc3PlLZKSms50Lgt7Jvc22SHhWFuvols+zyP+t620UuwJbb30lLRGUasXokr
         CDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706259114; x=1706863914;
        h=content-transfer-encoding:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AAsay6jB22qaSzogrkHIkA3rFjXEVcnbYZR8yiHsEw=;
        b=nJ+JrstB6qIMfnUhixzou2MHQMh8zxeyuC47THpOp3Q0rc+pwYQLrTzXXvdqWlgbkQ
         RlWBIHf9sqrarLOYVpklfznnXNNwGQOxCec2x2stQmzepw97kDQRcgl+mYwPUmDjAZCE
         giZl0CiNHwxG2xB7Ug6kBcZQunHWCGaYJpWHOW3prH0rpD6GOnKf1yujRzG0kWiOr5k9
         jm8nVFKJt3AkZ7Lzy2z3popBnjJoosSrgZDPDMIri33fQrP18lq/iRYbm6IKYpDmpRFg
         MKv2ann/V6TDQDYt2df4kYJOSa9BWf+Lqe03SjdvHgCmntESxYO/8nyqPDhTmcwMHYvQ
         +W4g==
X-Gm-Message-State: AOJu0YxjpkANCxoSjJaLxDc7jIWfh4PKg25oGY978cyH1uMuWBAZMha4
	4k4sNQeg63wni7irXrKEbZqwW3Vl98PKGBFeQS7zedqmCUljHexMw1Lb/wHfmj68BKSOZzKKjtV
	v
X-Google-Smtp-Source: AGHT+IHMEqzWIkHz+Se7cc8ovM8KbG9iQkE0yiXBav8pps/cX/7niytEJRaBnmmI977+hJhLEH7ulA==
X-Received: by 2002:a5d:4110:0:b0:337:c030:aac1 with SMTP id l16-20020a5d4110000000b00337c030aac1mr342409wrp.153.1706259114252;
        Fri, 26 Jan 2024 00:51:54 -0800 (PST)
Received: from ?IPV6:2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7589:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d6b8e000000b0033ade016ba5sm69009wrx.4.2024.01.26.00.51.53
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 00:51:54 -0800 (PST)
Message-ID: <b93b0a56-0207-4538-9413-36d59c20ca2e@suse.com>
Date: Fri, 26 Jan 2024 10:51:52 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
To: tools@kernel.org
Subject: b4 diff failure scenario
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


I get the following, seemingly unexpected failure:

$ b4 -d diff -m v5_20231223_kirill_shutemov_x86_tdx_add_kexec_support.mbx v6_20240124_kirill_shutemov_x86_tdx_add_kexec_support.mbx

Running git --no-pager rev-parse --show-toplevel
Running git --no-pager config -z --get-regexp b4\..*
Running git --no-pager config -z --get-regexp gpg\..*
Cache miss for 20231222235209.32143-2-kirill.shutemov@linux.intel.com
Preparing fake-am for v5: x86/acpi: Extract ACPI MADT wakeup code into a separate file
Running git --no-pager worktree add --detach --no-checkout /tmp/tmptvjh0w46
Looking at [PATCH v5 1/16] x86/acpi: Extract ACPI MADT wakeup code into a separate file
Running git --no-pager rev-parse f896eed4516c
   Found matching blob for: arch/x86/include/asm/acpi.h
Running git --no-pager update-index --add --cacheinfo 0644,f896eed4516c7e3c131751ab5865aa70cfa2d645,arch/x86/include/asm/acpi.h
Running git --no-pager rev-parse 536586d5ef00
   ERROR: Could not find matching blob for arch/x86/Kconfig (536586d5ef00)
          If you know on which tree this patchset is based,
          add it as a remote and perform "git remote update"
          in order to fetch the missing objects.
Running git --no-pager worktree remove --force /tmp/tmptvjh0w46



The 2 mbx files are a result of running:

b4 am 20231222235209.32143-1-kirill.shutemov@linux.intel.com
b4 am 20240124125557.493675-1-kirill.shutemov@linux.intel.com


The currently checkedout branch is at commit 83e1bdc94f32dcf52dfcd2025acc7a2b9376b1e8 and both .mbx
can be applied cleanly on top. Of course, manually applying them and running git range-diff
is a viable workaround but it would have been best if this "had just worked".

Regards,
Nikolay
