Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFA22C80
	for <tools@linux.kernel.org>; Wed, 19 Jan 2022 18:12:55 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id w21so6082468uan.7
        for <tools@linux.kernel.org>; Wed, 19 Jan 2022 10:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JoZBrTxNsFQphpJG5AfNXozjf7DOY1TRdfTG17iTsr0=;
        b=RpJjtiv4rlTOcnHZzCLav46DgY7LmnGskTdLv1YVwj1L6LHNWucFu6VLuJ65itkIWU
         vnXF0t+M0v1AvPhY9eUCPEd45GNSIqBG4ObNxhw1bOubueF2qItBnRrDzw4YUcuZZ9fQ
         NUSesbMZEEkYjawjqAfHag8h5VZu4ZaxIDDRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JoZBrTxNsFQphpJG5AfNXozjf7DOY1TRdfTG17iTsr0=;
        b=MoIHkEzxuRHlYOp88o79VDmM/RJftGHII33JyyNLahIo/PrGESu46J0cXBFw0uyQEj
         F28Zv+Ci0dDoGp2qmYRh+wvJPTju3jvHIK66wmUVV9LlX7aZ9ckAMC9dwPJ8EounJDPK
         /cJTZprEI3RmlmWsfMAhYNafr0BcmvQHTjbfLEzn/6Oo2W01zgV/rwpJDlAMikt9ENVu
         IHaRCQKqX2ZyoQ7sPSmlldZseHAgNrO/lt/QW3TTtxiCo81VNGx5vysCWvIBTCagwczf
         pbL8ch7gKyL6DTFHSQoz5WPqbgeM3kauJ+MkEo5fHu7Cqd4iJ/otKXfryOC0+WKCIKhC
         hlxA==
X-Gm-Message-State: AOAM530Ips+1qHxjCbsMaIwgggpa4x1CRWIOwfsV10hWW8W5kredCHRi
	QjFK5x6M6VPXnTJbij6BZML7kg==
X-Google-Smtp-Source: ABdhPJwBSSPTo8y7HWhlePvi7RrCOHrb+GWEjtPFnRLNPShpRr8nH7MGklWkWDSWj8CtjQVfm4s7ig==
X-Received: by 2002:ab0:7390:: with SMTP id l16mr12560304uap.73.1642615974605;
        Wed, 19 Jan 2022 10:12:54 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s134sm89355vkb.16.2022.01.19.10.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 10:12:54 -0800 (PST)
Date: Wed, 19 Jan 2022 13:12:52 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?THVtw61y?= Balhar <lbalhar@redhat.com>
Cc: tools@linux.kernel.org, Michel Alexandre Salim <michel@michel-slm.name>
Subject: Re: which version of dnspython b4 really needs?
Message-ID: <20220119181252.u6qvf4ggmuwpb53t@meerkat.local>
References: <91cde2a6-f71f-1e76-8bd7-3a3a0fcc6bd0@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91cde2a6-f71f-1e76-8bd7-3a3a0fcc6bd0@redhat.com>

On Wed, Jan 19, 2022 at 02:31:33PM +0100, Lumír Balhar wrote:
> Hello.
> 
> I'm preparing an update of dnspython for Fedora to version 2.2.0. One of the
> packages that fails to build with the new version is b4. I'm kinda confused
> about the version of dnspython b4 needs.
> 
> In setup.py, b4 has 'dnspython~=2.0' which includes version 2.2 but
> requirements.txt contains 'dnspython~=2.1.0' which does not include version
> 2.2.
> 
> Which of these two definitions are correct?

We can probably do ~=2.0 in both places. At least, all 2.x versions have
worked fine so far.

Regards,
-K
