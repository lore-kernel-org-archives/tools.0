Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCA521149C
	for <tools@linux.kernel.org>; Wed, 12 Feb 2025 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374615; cv=none; b=oMPyRvs4eP8siJqQ3AVjfoMjKncyjmCVvnV+Fvt/e54FEAJ1dCf7kTAsElk/w0WgZLbjyfjcObuTwUQ49Z+YInSw3iEMRkeGMNrrVx0YthVqqYtMJUvMApzw7t7IE6uF+w3ObvPo99hoPxmcGYL6W1sRsyQw6W/mN5LgXKItSCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374615; c=relaxed/simple;
	bh=JgY8HjefzqjLToRQBhF7/uzSWl4NKTaWBdTfXLwI3Zo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JKK4dA5eSIsOOGdbPs6F+rnINzGqNHhTbtcgCJHgiwcyIu0RU+ir2r9zpcpcxRkoR7o8Oh/+wpCHnRflvwN2tfEjTBU2nb78h+196fw9x0Gp/efOsCLobMEnutL2P2Y+rieACfJcLpFr76gdn4SmRcTUGNeTBtHzkGYASPya/A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0GZYSw3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0GZYSw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739374612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgY8HjefzqjLToRQBhF7/uzSWl4NKTaWBdTfXLwI3Zo=;
	b=T0GZYSw3PDgC/hH8bfMwFSME/I4SHf+OtX3uiVgRo9elolh29N2ObDXiMNbffwYH3mF/m5
	KWS7X/aJodm5XGPk9hGaMhQO/BhvIdSewlpk093127kL4xi7Uw6bFF2QAzw0oRYNdL2VcJ
	0XLSMZu/E4ENFmE5tOctZURdd57pw+8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-3bQuaCIyO96mxj0hmWTPkw-1; Wed, 12 Feb 2025 10:36:49 -0500
X-MC-Unique: 3bQuaCIyO96mxj0hmWTPkw-1
X-Mimecast-MFC-AGG-ID: 3bQuaCIyO96mxj0hmWTPkw
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab7ee92898fso161925966b.0
        for <tools@linux.kernel.org>; Wed, 12 Feb 2025 07:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374608; x=1739979408;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgY8HjefzqjLToRQBhF7/uzSWl4NKTaWBdTfXLwI3Zo=;
        b=hU4S3OJ30H5vibORLoIzAQKMPNw5q2E/r4HTbcjUmE7PXAP1jUm14UE4bN2Ty3KyDB
         e1BYO8nvBheWOyVUlG59xGlrNop06E8rZQGq/TU4jHKRUnw8XZAzk/20QH8J7wvJ0UOE
         SXiAyRVzvimMh6v89ys/5Xd8tPxO5kfVT0xPrbiDF1Q/kzfnf52Mb7KTBiJwSopLnpJG
         lAeo357WzBJ6Gr0UxrRghUPDsm/9s+BbkxHCM2ifyOTjuz/0ljaZdv+nnF/AY1sUlUt2
         720X8YTl5Y6zM7FUSt8kNnwiJsE68BqI4GP4g3qHmzJE9ex1X6jzy/6+MwTCvpuUGfMj
         N5tQ==
X-Gm-Message-State: AOJu0Yzj2ffw9lmsyGMo77rMZNq8suu1XRxfB+bvz/zzNc+2U95MqXiw
	Iyee7WaWWrV02E+EwtQJtiOrSUXO8NRqyWCxFS+2Y7059gNTPNKJjMZtL709FBT6pILjDJkpp3Q
	VAQHN5BYah8APwttRvppnSxrRdTR0QBsQVr5iW3jrga6ReappkYoOq4PW1yXI/nBC7QU2DJ8l0N
	T933D6rAWCY44mgGJbpLhRoINnsOjMkeZj
X-Gm-Gg: ASbGncvQuJQG9aecKZp5XzV3UWJCq0KcqyLGtzJCjdhGDZv63wOefdSC2JgoLlQ8rTB
	/JXlk9HFmerqTp4TrynTELnvn9smfAIWJxumRDAZa+yMHrreFVqJalSLelwZgAfWpzmSaWE4h9a
	VnkVe0FXYVXiKVbEsgpfNF2kkbx0skxT6/ygkqwE3t9JlqAUpBkWwxKpI0Su/ldIrULjIaR3jxK
	MQT+cdIWGSTdQLusn+MSEowjK3e5e58eMW/bB9AtYF0ml/MeqjDTQct11A00Jk5qBgqeVGyqvlw
	W79woNMtVew4XzG9RVrJDT8rppnIvA==
X-Received: by 2002:a17:907:a08a:b0:ab7:ca44:feb8 with SMTP id a640c23a62f3a-ab7f34ab834mr352535666b.52.1739374608187;
        Wed, 12 Feb 2025 07:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZn0/ywmg9b7fW3lkqk2jDaRS6VN023ON02+UsCBOO7LkEgGA9avZOJvB+20M8Wsp5hy1jrQ==
X-Received: by 2002:a17:907:a08a:b0:ab7:ca44:feb8 with SMTP id a640c23a62f3a-ab7f34ab834mr352532266b.52.1739374607851;
        Wed, 12 Feb 2025 07:36:47 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ba97704dsm700724866b.107.2025.02.12.07.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:36:47 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 415D9184FE86; Wed, 12 Feb 2025 16:36:46 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 feature request: run command before rewriting history
In-Reply-To: <87ikt8bm6h.fsf@toke.dk>
References: <87ttdkrylx.fsf@toke.dk> <87ttctc2vk.fsf@toke.dk>
 <20241030-perfect-hot-chipmunk-ffae87@lemur> <87ikt8bm6h.fsf@toke.dk>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 12 Feb 2025 16:36:46 +0100
Message-ID: <87bjv7p435.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: szIMhQ7JJA6j0ROg0l5LgkY6svUz3CEB4rUE6DtKDLk_1739374608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com> writes:

> Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
>
>> On Wed, Oct 30, 2024 at 11:16:15AM +0100, Toke H=C3=B8iland-J=C3=B8rgens=
en wrote:
>>> > Do you think this would be feasible to implement?
>>>=20
>>> Hi Konstantin
>>>=20
>>> Friendly ping on the above? :)
>>
>> Yeah, I hope to be able to look into this in the near future. Unfortunat=
ely,
>> I've been dealing with less-than-pleasant tasks such as ddos attacks and
>> trolls over the past couple of weeks, but at least it's finally on the w=
ane as
>> people move on.
>
> Right, no worries, just wanted to make sure this didn't get lost
> entirely. Thanks for looking at it! :)

Hi Konstantin

Another friendly ping on this? :)

-Toke

