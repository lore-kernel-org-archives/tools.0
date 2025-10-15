Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A628369D
	for <tools@linux.kernel.org>; Wed, 15 Oct 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540642; cv=none; b=K2GThfYLk8De+E21Dtq6UjypSFIx8dG4gjzkkA8SVT/1dFUXBTKa3yqBSa5CvYQbFPKvGOgfpmP/oz+r85/vzVnHe9H2rjZn05Y3xiflYU+s1Mf4SJ+WMTHpPNTV2ugw+GI8c59557lI6I76RYBmjUhQVeU+4/r5MVrVfX0buDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540642; c=relaxed/simple;
	bh=Co1eCJo0zoK2mbM1t5Boq9vDlS0pkb3DVex+hW0tHhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ompk5LBzBqP0WIDoBXkmERtQk4czL7aj0Qk4G10ZoIej2gDvrqATm+EuOcRP0jiJY7wGjd+EwbYqCXVVch9VPBpeLFUDBU1Y1slIz76P/jVNxFbFTagRH1GHYotBg4qkbBohoSKRj3/K+Qq82jMVXQb4fjzpK2gEgbMuxNE7bmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JBBJf4XO; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JBBJf4XO"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-88ec598fa11so64802985a.0
        for <tools@linux.kernel.org>; Wed, 15 Oct 2025 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760540639; x=1761145439; darn=linux.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DZmP0ZLpmBL7Q8rS4WYAfSzgAGZly5b4evBwumbVxr4=;
        b=JBBJf4XOXUci8JXTay6GfT2+9SaiWm6OW59R+Dl2OCgV5Po5mvuluXWuCKphgKSAti
         7Yc3deCHnCjdmtg0M/tku8v0xfViPA1lASul84J55i/s/z3DBLsVwcQTNJIaUvbKARNk
         /dZB2OicwE1aZXeYsQ26aGa0w2Y9WmGOL6oVd2oxQ1LNMD1at2ZH5xrpCZ8LYnmdWhWs
         2zG2g7cC7Ix5VYvMMscizIp2lCe3JYmYbJUu0SiUtx7LkPESGWwsqJ0tFyitg2kCrjvp
         35HAUgbun1zEqFHY8M8lvrOqaOMif3cNuJ3kt/0/aibQZFAcDNHIcydI5fqrmk8N+Sid
         jE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540639; x=1761145439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZmP0ZLpmBL7Q8rS4WYAfSzgAGZly5b4evBwumbVxr4=;
        b=saPob9Sd6VfInfupgdWxN+bVSvPyA6vRHBta0H530PoF+6CGJZFKAXxXEMxXWK1IbH
         1nfdWm97GjL9yV629Qt07wS3q9tNw7oZgFee9PHuiXzDd/5/IMTdJIu2XUOc3IswwGdg
         UrFs7uvPnDAEsjzREmCV6tpRJnvfo1aNs5PHmsVYUK6RPbZH5IaBDjRejEzy1lZORBxA
         Sc9R8SVUfQQd4xyYXJfVSxGMpKdm04+HPuGL1b/1nHIqxc0UdpoFKoMVdWrdiGo/3gh8
         lHrHCZ3XO5Om8QepsVcpdcA+c+2AAuchQ4N5kexuzaUBIs1KOVnq09rmZj6DwhlYUq8N
         rQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWOJa0VOdEF4OW82cHm1cveZuamnHEpofqakglrwRCZO7sCvmeiEOT6Pziwlgcq28QDpbKKLA==@linux.kernel.org
X-Gm-Message-State: AOJu0YwDNz9BFAV0mBYUZzKng5//JOxh7fd+s1UD0B6gAy2Vck4ctxMV
	nIpHEYy7S6gXaH4vDFqnSyqtfDen7MglEzhyRA0hugO4I5CVOpLBlCaqoqGiyksrNxE=
X-Gm-Gg: ASbGnctHe8TqHTYztc5xcXxC2HMzqnz+RTkACDca0y+62txl7rt1U5+vDTNpsO+orn7
	5T42QhQj53aPsrZ3uLo96MPw4Znvb7ElX0HX8POre+RJY1IAtRJEX6Mcvr9nJSWzP3yoYLX5psP
	H2V0fiwECwk3yN7y86FQuU2ESmCGrqmxMCRMMgIKGImDF+XHyBmj9jNXtIk7besFFYXsDBCiKjM
	mfV1v8SENyukOeJH2qYGablmgIP5GkHocsLiqS5VfMle+UlY7B7ju64YPkx15rEQVwjIyOLP89i
	/ILzpcAFonBbblDIonsqMesPJL53Zjz4qR4ceJKStSvJebUS+AWRXAzlFy0i8f2D3lzDkJ0rgXJ
	jXizpuqo+m1xBShI=
X-Google-Smtp-Source: AGHT+IFIAesJV+GVwnHglaU35UkaiCTD7agc5W7n/d9794Pw5h/2sx/uVfV1muKazQQQ6LUqO2ew5w==
X-Received: by 2002:a05:620a:2987:b0:829:8de9:a0bd with SMTP id af79cd13be357-88f0ec962ffmr63513485a.1.1760540639317;
        Wed, 15 Oct 2025 08:03:59 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a293a9c1sm1442161385a.63.2025.10.15.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:03:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v932j-0000000HR1i-37wl;
	Wed, 15 Oct 2025 12:03:57 -0300
Date: Wed, 15 Oct 2025 12:03:57 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, users@kernel.org,
	tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251015150357.GG3938986@ziepe.ca>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <CAMuHMdWxMhM1J3zHC8OkN_fd8XsJPFA6jM_3JFU=ySKhnX6ESw@mail.gmail.com>
 <yq1qzv49yb6.fsf@ca-mkp.ca.oracle.com>
 <20251015-zealous-debonair-bonobo-575799@lemur>
 <CANiq72nGULF6LpbaVDr_dp1soS3zumk0QtSDqj330XzMgEHYqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nGULF6LpbaVDr_dp1soS3zumk0QtSDqj330XzMgEHYqg@mail.gmail.com>

On Wed, Oct 15, 2025 at 04:42:29PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 15, 2025 at 4:16 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Do you normally edit them before applying, or after, when they are already
> > applied to a tree?
> 
> In my case, always after applying. I mainly use `b4` to get patches
> successfully applied (ideally in their original base if any), and then
> everything else within Git, including rebasing them etc.

This is my flow too. Everything is done in git after am. I rarely edit
the commits themselves (beyond am'ing them on a whatever base I happen
to have) but I frequently edit the commit messages for clarity, style,
etc.

Jason
