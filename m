Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803EA199231
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730370558; cv=none; b=Q8VLxC3jdnrOPG3LhdyOKD9nmpY+n4KwscJK4jRbXUiH2Lzl1hgqNT1yBzXJixwZVXV/UAB7ys8Yx1Q1n5IfrNizPY6vd/AsV28CAMTbNx9i6hRiC63rc9emdvvW5fSxLsvsbCIpcqYcz+IkngSsapahXZdZ1N4+pBZSP2ictMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730370558; c=relaxed/simple;
	bh=wqdrH+cLnvxfFBEc1yxMqYKYVirHUpzdZ65lj7FjMr4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jb5ZVgini8SrEK0o8c9IYaq7c3PdUKY1pLeTV37OneoFOECAbjGhqKlsQSnQHlToTXJhjOV2oRpTvIlYlPAj7ML/TriHLwrGFwk4i4Obgl/hc8Jf5+cIuU9G9s0Fx35JdenbkjEDhboFlrW1RynVkWPXkJZcdHWZZWCnwWIB0V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONwAd+cS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONwAd+cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730370555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqdrH+cLnvxfFBEc1yxMqYKYVirHUpzdZ65lj7FjMr4=;
	b=ONwAd+cSc27qW5CFsdlyyqRIp2QN6dkg+unYKQWZuheznjHrzH0W+mgZwGCgWdETZjX8+m
	q/b+rEOdV0hVhdUGznIBL8QP0CXPflULoM56b5ElDRyELeeiufRj3MSm1/O6u5Oa+Wqb7Z
	9BtWsMXXwO1hWzD1OMVHy0nzbezzh+E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-_MXLa-n9NCmbifJDcKHCTA-1; Thu, 31 Oct 2024 06:29:14 -0400
X-MC-Unique: _MXLa-n9NCmbifJDcKHCTA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4315f48bd70so5788615e9.2
        for <tools@linux.kernel.org>; Thu, 31 Oct 2024 03:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730370552; x=1730975352;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqdrH+cLnvxfFBEc1yxMqYKYVirHUpzdZ65lj7FjMr4=;
        b=j8AembkP//HYYoJhVxludjYuSMHB5TctSMbp3TfDw9UKQctle9fF03BvDYN7bm/3sU
         cfI16jm3xP1mBOFq0XJCZVDunS9Ctpt+Q0BA11g23Kuew0s9fTDuUl10kE6j+S52DQ1Q
         GbnI3dVQZRjKix+W+7PMhhJdSVK2A4MRpKab8yW499fac3HCXWAghirz1bbUxSS6ny6a
         Fbg+JOilb8hvC/L+tOBc4pN00mRdouzHLXcDdYXuk+5BoPI0JVcdEsc0yaZ2yfNpF0NK
         Oo1BXexXU4QpXEK8+HE/VmPVdXPOFb2RiigYikuCGCJlQo//2hXGqmtk1lqpNm00s0sn
         itYQ==
X-Gm-Message-State: AOJu0YzranVjVl9lWNcpjdhXjC7KIKB7lywcG/Ev6uO1QXDeUhpaNBC7
	ZQoI3TGneZBHqLIVZQlGPYEYpuJjhIX8uMEr0H+5Yelcv1L7vkcs21/sXRU2Vts2eMtCHE6yU76
	/StWselqHQnvvr2/m94Y9fsF55u0FPFkg0FV1Be9QTcwslvMysouz/14Xc4NKuu4wNa3xbRHpbY
	s12aDfjIqwAFHyO59aCkZlTYqkeClR2k/k
X-Received: by 2002:a05:600c:3b14:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-4327b6f9521mr24763055e9.11.1730370552740;
        Thu, 31 Oct 2024 03:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn5GHQgZamPSuzYPzipCdA7nlCqEq3dguHvNKLs2u6XMSUnxZ106J/TvkpNQgZXsZ33ymjeg==
X-Received: by 2002:a05:600c:3b14:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-4327b6f9521mr24762885e9.11.1730370552393;
        Thu, 31 Oct 2024 03:29:12 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm52128495e9.22.2024.10.31.03.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:29:11 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id A88CD164B755; Thu, 31 Oct 2024 11:29:10 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 feature request: run command before rewriting history
In-Reply-To: <20241030-perfect-hot-chipmunk-ffae87@lemur>
References: <87ttdkrylx.fsf@toke.dk> <87ttctc2vk.fsf@toke.dk>
 <20241030-perfect-hot-chipmunk-ffae87@lemur>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 31 Oct 2024 11:29:10 +0100
Message-ID: <87ikt8bm6h.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Wed, Oct 30, 2024 at 11:16:15AM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> > Do you think this would be feasible to implement?
>>=20
>> Hi Konstantin
>>=20
>> Friendly ping on the above? :)
>
> Yeah, I hope to be able to look into this in the near future. Unfortunate=
ly,
> I've been dealing with less-than-pleasant tasks such as ddos attacks and
> trolls over the past couple of weeks, but at least it's finally on the wa=
ne as
> people move on.

Right, no worries, just wanted to make sure this didn't get lost
entirely. Thanks for looking at it! :)

-Toke

