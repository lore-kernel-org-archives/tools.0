Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0147F29D275
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760396998; cv=none; b=T8BilqWVuxPxcK6JXR87M/W/gdiQ4+vwS2KBdgKaohmieawZOr8kEKWfLio3qN6Esithj6ivPjmnOu8ur3UswCrxuutLUDeZzgvR0M1+tfCA8XApatpqw6CWUl5Aaxh/7E57LSQ7rhZT6OzbWgH0+wAp+9z0CMMgG5zB2llNf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760396998; c=relaxed/simple;
	bh=ibNI7g56Bu4gCKFHclopP7WzTz6uWTFeguWVfcj0Jtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=dKzSuGwwwlLJtueXFmA10TJZlXaxYG/mOu3YT/WLuzNfMrX8K0dxbyiPwW/EQ2NFGhyCgE37luyCsNIaSe964ug86cK8L/kz/yy+w+PrvwXDngQlUdu3rj57Kaoy3YqTf3Q66CHXPqE3QTUNpPzrYz66zjYqBtY18NqBSJ/VLw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FlInifls; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FlInifls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760396995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b1jQi6kbLD10lqFfN7bzb1ygIk364h6vill1WOvAoWo=;
	b=FlIniflsf4HrQfbf7kNbDDxXoInG4zAzgzIYOpkEYvJvW22FcLazYjRmUVj7xfeHdCly0d
	QiaHfJGzr2uDBRLQ14VpKGHWHpt+ZZvpv2Lal4Wm034aEeJdOABS7oskjUSA1zKmhciJvY
	qYZ3taBgHAkT59zsLVqc4URCFHjFXH8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-Tybk0XKOMke8OZ4JvddcRg-1; Mon, 13 Oct 2025 19:09:54 -0400
X-MC-Unique: Tybk0XKOMke8OZ4JvddcRg-1
X-Mimecast-MFC-AGG-ID: Tybk0XKOMke8OZ4JvddcRg_1760396993
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so31830815e9.1
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 16:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760396993; x=1761001793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1jQi6kbLD10lqFfN7bzb1ygIk364h6vill1WOvAoWo=;
        b=tgsk/A/VOrAbcGQyxAzy/yI1sDRteK08rbQQBgNMZNz57dsvxdf2LDf6D01o6X5A9G
         q73JvudBDUwHm1LtnmsTxbVe8df2sQ7xbEaePXqXDyHDRouBKCGaUpLtPR+i70a7Y+q+
         aw3TxkMsRJgJvut7pLqW2dIea4Mty5VbAVmGGy3g2ZmVFDDjU1gMQ6yquGipDHdhhOyT
         AIgZPml9ropDEkBdjyeXfeBXlYTeE019zsZCSsqPqBHGq9d3cvPl1/t7GVFkjKMvPjdN
         38BT6hBWkhFBMkrxheOQP8LAF4z5mVE3Qa/JjHplxUVOJJ6QjHvWadvhonoS09jPh8N9
         mdgg==
X-Forwarded-Encrypted: i=1; AJvYcCVzzEEEv6eNarqzNJ6C2Vfj1pIiRRg32YRoz84eYsSlD1QlQ6mYG48/I0ltCGsiucgqCb+muA==@linux.kernel.org
X-Gm-Message-State: AOJu0YzXfUwMZRiEXDPSgOkE7/7NK3pPGufkZ70nbbazcClDLhU4fttD
	pjqcnVt1PNc8L2GP0ssobQHeHFhaq2iG51yLa3WwqfV0dHHCyXf+afPOH/V7MFqs49CMhyixC73
	ubobtTF4BwVurNbHkkhyjuGmRwk1BlDT0uTJ5dzVIRL7uXHmWOn0oVZxDLw==
X-Gm-Gg: ASbGncsOzJNJiBVdWQ3z9eL8udJwyesfzuOmPUp92pm9cCYWQ4Hr6Ib486vwsQpnjKA
	xYqafrws5xXLT7lPMRFr6GpKO3eIrrytT5CDPMYwDV7Z9zgHzu+i0gPSUGCiACYdr2PTc+eBW4k
	Us+Ssxq37afj/8CbFhGoNf+ewnizyQMLzR0m95swrhiApI2msRc+rVK/c4Ecl0Kw/OkJVJYL7hZ
	3DAFKF8KpPENh0JdtzNO6SEFTtWjAPi1xfTwfNTSLuKpol9K7vTh1tj2WyqRi/lYp8hJ/yH+RQb
	8GB40pY3tks9fFHKYNUTvNvpO2Ki6nIDpg==
X-Received: by 2002:a05:600c:8719:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-46fa9b06cfbmr180791985e9.31.1760396993402;
        Mon, 13 Oct 2025 16:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGh3guFre4bEPDcEhidlOr+RL9AI2LfbH9Ti7XFsY3KmeMaA2xP+1Hmaz6fmhGHfHdncod5w==
X-Received: by 2002:a05:600c:8719:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-46fa9b06cfbmr180791835e9.31.1760396992852;
        Mon, 13 Oct 2025 16:09:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm141161715e9.1.2025.10.13.16.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 16:09:51 -0700 (PDT)
Date: Mon, 13 Oct 2025 19:09:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013190418-mutt-send-email-mst@kernel.org>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ThEX7DDP1CpUsgE8d5VsOWREenMxcCKFB2_frkDsy70_1760396993
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks Linus!
One note:

On Mon, Oct 13, 2025 at 10:00:01AM -0700, Linus Torvalds wrote:

...
> Because we *HAVE* automated information that is already sufficient.
> Every single commit already fundamentally has sufficient information
> to find the submission if it was to a lore-tracked mailing list:
> 
>  - patch ID
> 
>  - commit date
> 
>  - subject line and patch date (note: maybe from the email, maybe in
> the body of the email)
> 
>  - author name and email (note again: might be the email 'from', but
> might well be the 'body of the email' From: line)


Well I for one would often ask the contributor to repost
modifying just the commit message.

The only thing distinguishing posts then is the date?
Doesn't it seem somewhat fragile, to rely on date?

E.g. thinkably someone can post an old version of my patch (e.g. include
in their patchset) and at the same time I happen to
post one with an updated commit log.
Now what?


As a maintainer, I also sometimes squash two patches together, what then?




-- 
MST

