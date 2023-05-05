Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A3FC8E4
	for <tools@linux.kernel.org>; Fri,  5 May 2023 19:12:05 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-61b5a653df7so20144476d6.0
        for <tools@linux.kernel.org>; Fri, 05 May 2023 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=GZJWOSjq5YLUs3bzramzfp6vQP7hZAvgWOnsYiqq4w6xvhxRqrFhQRZHUgnEm62bb3
         G4QwIWsyqqJzNO+PVSMeILQKktJbQo7vgunwEodsBQ2NF3Wty2UoYDRfDMBLi8m9M7kj
         E8RgtVxaZPKfE17StgMTqjDxe2IsBWXxquuwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=c60rubWX7grTocV1jus6vysJ3CdxOItbL0GeOF/mTVLtlQ3dlUqeXn0FKnixIKaJXs
         f1Abr05qWEOWl0TFvbh2AP6vE6BMP+grbpYico0YniTMrfV3mrnGe6ykECM42KPxdNMv
         UOrKLB2vPIVfjlMJPJlwXeIIFZoVsmIqqav2V6vEg03bcaXn4PS2cGUZYdwUn9Wl2JWt
         wWLhtL4HnPszo7XaL3bTLFD4PE7e2GvddULYy583u9oYn0zqHmX/C9RnrfkSglLB5suk
         VfgOJyP86F2fRMzJVLyv3H4OcdvJg7u7saf/svp5JkRksK1VQgL7BHMU9vAiwSTtAY9t
         Pyyw==
X-Gm-Message-State: AC+VfDzby2ZvyaqWRkoUq9jRK1lanaVQDLERF3uhP6NbMyyE/wjIdVlO
	zegaXWx+CSWFvPVrAFL80rK9MQ==
X-Google-Smtp-Source: ACHHUZ7anJS/esKCfu8bEz7dpeuCicbGJYMxXFivH/mYdV0Vz+p7cTVrxKczFd82GvVWxH/PLUh20Q==
X-Received: by 2002:a05:6214:27c5:b0:61b:5ca6:b7fb with SMTP id ge5-20020a05621427c500b0061b5ca6b7fbmr4228889qvb.28.1683313924771;
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id g17-20020a0cdf11000000b006210a12650csm42045qvl.145.2023.05.05.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Date: Fri, 5 May 2023 15:12:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, aros@gmx.com, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505-lent-swoosh-4897e2@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230505085218.60c62d75@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505085218.60c62d75@kernel.org>

On Fri, May 05, 2023 at 08:52:18AM -0700, Jakub Kicinski wrote:
> > Per our discussion last fall, I've been working on a bridge between bugzilla
> > and public-inbox, which went live in the past few days. It's still a very
> > early release, but it can do the following:
> 
> What about closing the bugs once they had been fixed/triaged/proven
> invalid?

For now, bugbot can look at a branch in a git repo and close bugs when it sees
a matching "Closes:" trailer.

-K
