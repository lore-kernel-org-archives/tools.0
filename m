Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE713715
	for <tools@linux.kernel.org>; Fri, 14 Jul 2023 19:25:03 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7673180224bso178188885a.0
        for <tools@linux.kernel.org>; Fri, 14 Jul 2023 12:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689362702; x=1691954702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rP0c8ufCAqjlFGJtoHMn+fK+O1EoPkPUWKD8tCz6vpc=;
        b=ZTiL76AAvKDsHc2qGQvNg4Slzkl9efNm1m6dEi//jx81klHll1vL9rsMKHsKMd+7zZ
         FB2Vb3mBD3T3dtzWelv3fYcDnjOJcc5Qg4wIAwTspuv5XlWn2/Y+HwH3MF/jWsxD/W72
         gNjyLi4YNNdPJFozWmp2ghudXzWN1sQAMKch0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689362702; x=1691954702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rP0c8ufCAqjlFGJtoHMn+fK+O1EoPkPUWKD8tCz6vpc=;
        b=IS28mR9p4f5sZSBVDb4Z1IPKq/bAFyEW3NaAuG0x1d9WGXkeEKklYvSpQfMd7kZFwb
         hQ+ZH5vP+tbzdpjah4sfYN3tY3udddsyZ6W1ZCaR1sObtO0mNSTppDo4PurX8eAnKbwS
         YNS2soISGslM0oqzGQAPt9q7eTMuEcs2ujnPsa7agl7/V+9EqQUJ7iuvFOYSqzom1adI
         FQ0NcMZn/e+2RsOJopv6A4e0Wb+lYOAWy0h84QoZVP8iRvF9WrxLgEf+TPm3nmn6wbF+
         GzqGj4wUe2B75teWIarFB+XxvoT8W0KIiKXFEEu8iMyH3s/l482bPRJahTdA58HAJ5VU
         r/6g==
X-Gm-Message-State: ABy/qLZC7/juGE300MACv8cKxLOc+4Yo4XyW4VYcWCaQu8tar1yRTWvX
	wjfRsjYwhtORPqB+n5aVhyFd0A==
X-Google-Smtp-Source: APBJJlE5oww+9ngIS40D8Qv0mIzoOYRy20cWwEGs1Qq4dWEsolv6LyoSA3NCKaV73cr3F7SxVOTydA==
X-Received: by 2002:a05:620a:4408:b0:766:fb05:d7b4 with SMTP id v8-20020a05620a440800b00766fb05d7b4mr7368671qkp.57.1689362702032;
        Fri, 14 Jul 2023 12:25:02 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id n24-20020a05620a153800b00767b37256ecsm4024348qkk.107.2023.07.14.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 12:25:01 -0700 (PDT)
Date: Fri, 14 Jul 2023 15:24:52 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4: ty: Feature request - configuration option to send to
 'myemail'
Message-ID: <20230714-apple-broken-5591b8@meerkat>
References: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABVG=qdHsB5pa8rOKCV9s2WtXKZ-Qh1+8q=1VNcorM37P4r1EQ@mail.gmail.com>

On Thu, Jul 13, 2023 at 09:58:34PM +0100, Lee Jones wrote:
> Good evening Konstantin,
> 
> I notice that `b4 ty` forcibly scrubs 'myemail' from the recipients list [0].
> 
> Is there a good way to ensure `b4 ty`s reply ends up in my Mutt based inbox?
> 
> If not already possible, would it be plausible to prevent the
> scrubbing?  Perhaps behind a config option?
> 
> Thanks for you consideration.

I'll think about it -- maybe we can set b4.ty-not-metoo that defaults to true.

bugbot assign to me

-K
