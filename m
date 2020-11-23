Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.42359.1606165126779999323
 for <tools@linux.kernel.org>;
 Mon, 23 Nov 2020 12:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bg1Dko0v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.195, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f195.google.com with SMTP id h11so6825595qkl.4
        for <tools@linux.kernel.org>; Mon, 23 Nov 2020 12:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=sRLt6srt1yo2dAOx4xp85n+KL7HUl8Iv3Z47l3umiMY=;
        b=bg1Dko0v8TbK8TnD6/C5czFTqK4EVtJTVThSMvOYNoKteytInGzhJfjGpbbkoaBzQW
         ut1in6rEaoY2E+NlRAu5H0aoReXDtosvj/qhxWIHVuS93+fb0tcpOOlLzFrSVXItIfAd
         bfDjnERrTJzfhf4YhL+4FW2ktO71cNFkVTrbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=sRLt6srt1yo2dAOx4xp85n+KL7HUl8Iv3Z47l3umiMY=;
        b=bFqhQdkZ+drnq1ZGm4zBuSZVzh5lgA3e4Gi4e49klFqaRomeAbGPpVyfmgkhpEg04e
         IbnYSs3k7ysvMxq1H/N0gRfBMUZ5u/w/oVQz82LrH86QJ674hL9lub6qYmk5+d8emEW8
         /kUuv0Gq5UtcgBoCPcgSZmbftD3mx5Ge+ILVW+srkRew1VG7fmyIURC9gYBIKiPvgAXg
         V61X4xtqHlioY27lzU4XBdhvBY8R60EoWyyjqF7nkMk+a+vNhTiTdllWDof9FVuDNdY7
         mx+E6ZUsoFDdiLWPc5osZr/oeD89c0e08T/0oxbbSJpDJnn80N2SxtojbssJSnfjnX29
         vq9g==
X-Gm-Message-State: AOAM531r/FfWpHQnGYKm045itnKzaRkPxGbIN9jYr/McvAO5eS5yS2KM
	bp2/z469JoKvZFdlLgTQR7s7Iy3LPfRl0upZ
X-Google-Smtp-Source: ABdhPJxpHucm7d0m/nDOsx9oQDYoroPgZyDhBccZ2uX2qOeRkkqNFRPo+rXNb0Ag1KCvZnkktU7mYg==
X-Received: by 2002:ae9:ef86:: with SMTP id d128mr1423892qkg.123.1606165125390;
        Mon, 23 Nov 2020 12:58:45 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id n9sm5664788qti.75.2020.11.23.12.58.44
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 12:58:44 -0800 (PST)
Date: Mon, 23 Nov 2020 15:58:42 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: in-header PGP patch attestation in latest master
Message-ID: <20201123205842.owomj4qojgjmtjzr@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

The latest master implements in-header PGP attestation, following my 
ongoing work on that subject. I am now convinced that my initial 
attestation implementation via detached "certification documents" is not 
sufficiently fault-tolerant due to requiring access to lore.kernel.org 
for verification, so I'm moving on to in-header attestation in hopes to 
come up with a better scheme that doesn't require any central 
infrastructure pieces for verification purposes.

You can read more about my proposal here:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/patch-attestation-poc.git/tree/README.rst

The latest b4 implements the PGP attestation mode both for generating 
and attesting patch signatures. If you would like to trial it out, the 
easiest way to enable it is via git's sendemail-validation hook and is 
described in the README:

https://git.kernel.org/pub/scm/utils/b4/b4.git/tree/README.rst#n33

Please let me know if it's working for you or not.

-K
