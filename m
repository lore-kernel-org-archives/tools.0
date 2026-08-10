Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC1360EF0
	for <tools@linux.kernel.org>; Mon, 10 Aug 2026 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349486; cv=pass; b=tVs5C8Brpdc8NHwcrSXgrqDyDdlaYjX/bvx9K8WzPnoz5/0xM+iG1z9vg7B7UafnKfQJpQGS9FApYfCHVoGhwbFXsrWPA9t0q6zRO15aewfbubWmXidYfy6Dxylg/B4DI7TKnAbKiXt2MYzQ+nvqBL+iVoQYBrsnKn8Zh6+WDeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349486; c=relaxed/simple;
	bh=IZ+Mdh0yxMlOsJcyQT+YSudmag0lkGs+y/35j6XD6VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sh9EzCj2ezy6jAEUjm1ZXzJ4Qh7QPr54bJEFbbiNN1FiH857gG9Xn/w9uF2QcKevgaECxiX+Kmg6D+U4dRmXvnqRG3BqXa2LqyMFNwza2W3AwdMMzfu4Dxl9h+Sr7IsllpAEoOaZSM4u9+LnPxwbfPMvkYLGyHiGwaNw/mrMF/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdVu9483; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdVu9483"
Received: by smtp.kernel.org (Postfix)
	id 844721F000E9; Mon, 10 Aug 2026 08:11:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786349485;
	b=sLmHUD4ZI1amQoxqi4NAODX926MyaMDQ0lyO5NjjKvcVddkFrDVaUSiyeSH/uX9xqqw1
	 9AUrWEBTqyPxbnODFOj2L7JEHstiznoXVVSATst0/MkkiupAXHOEKAV+bg/bezjgh+kyh
	 OkAVfXttPJDSJ6KgaZ3b9aofhJNrP/GVzNXY5Khot2gF47tJFyuhV6D8sNgj1bZAqqxoP
	 JX7yFo+bp7AIind4PyA4tlGnOrsU1DUWmQirFjDG9vryDDItgRKBYXvk4qWr5mkJvo0jJ
	 wFS9JhRYm/3Wwd5kCCzzb5OZ/AfCYfIeR9bovuEvavvo6Bzbu17vVybEA9P2mY44Veg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786349485;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=st108+icnxRbvr6bwTwYcQHplLI8r5Zr172D40ChP+k=;
	b=s5w6BP3Wf0TrLsO/gqGx74WNiVOfvYGlFs4UKmHkAB1nx4wVhvSxZk7HsfZfDtFemmAM
	 2DstVynKpeOKcRLKH1Hy2cmEf7JXp24QKH24iwaxDAjJBI7b6on0dxixc4og1aIrUI3TJ
	 RYNV+uGhivHA8rl0zw/j5qIPAXOLgwonlh0ZZOGBYTuYlildZkhQ1ylNl0FYa4ZIvUF6D
	 KHPTHC0yNZnSgVLaRMgSSeZO8ZMcNcMAOkZt55u/RSpe1R5zBCdHR7eaivQI4NGodV6eu
	 DrS7YOMFadpyX7qJAj1p4pHN83gvKpPS7KBgxmWKfGYK4ZsR8hrIyByCHyJlTlzsKew==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bdVu9483;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9F821F00A3E
	for <tools@kernel.org>; Mon, 10 Aug 2026 08:11:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bdVu9483
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A9F821F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786349478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=st108+icnxRbvr6bwTwYcQHplLI8r5Zr172D40ChP+k=;
	b=bdVu9483qjcvDtW7PKGqHtg/+TDLKj2j4AvjFe4ZvykfOmy1dP8LiT0wrS/62Q+aA0Ji8x
	ieG14YCeC+aEa2WaOosGuzwsq4dvb/tnEPm03DnkeEv0Z86rudi+lQ1W4mzDG3OpRCw4uB
	oTk/D8Ukb69xhktofyPB8UOfnGRx/MQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-DYURB4zsP4e7orlCZ6M11g-1; Mon, 10 Aug 2026 04:11:17 -0400
X-MC-Unique: DYURB4zsP4e7orlCZ6M11g-1
X-Mimecast-MFC-AGG-ID: DYURB4zsP4e7orlCZ6M11g_1786349476
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49808ea1b64so24081965e9.1
        for <tools@kernel.org>; Mon, 10 Aug 2026 01:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786349476; x=1786954276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=st108+icnxRbvr6bwTwYcQHplLI8r5Zr172D40ChP+k=;
        b=muetsPc34pF4PWfDi0AHjxTUf9LsEaajXoT9EDhDTPhPiknbiW6VmAIXC0emdTat7x
         pYFq9nn+8fvbRGUWeQPJ/fUHTejRDSm2zvt0V9BfLQO4Fy5MPJwXfSyrYagJXzAwDTHr
         ojTYndOlzXLRSH5FmPG2t8k22vsCzAa1Xp19WQHtU7sh3bY3GgBTZGtZemaX3RTOZN8y
         aujTMmZlKcsp6nba1fzjpGwIVoVytrAS8/2m4FCE8QYtxo7EXqA9zdKyafGNUe9G84fI
         UdGLrYYcL9IqBcyPlwOFcQtwJQkfZ+vvljZz5O5WQPaaPcbbIQKFJ1G1ueDh9VTrQOih
         MUxA==
X-Gm-Message-State: AOJu0YwjdtL+mJpqIRWW3LOESFVrSUxyHgITbFTVrWgCFJg2QYEnlNfo
	6BQF0B7yl+dwssasX9+pMJfBji2rDIBPZPA7nzvS7PUogZ7l1vxCjkJJ62jqhBSR5NTQZCOqs9W
	x1wOnar3thr0WJvfpifvsrZ4W9TToGnxfb6eGBWuuN/RENa5Gsw==
X-Gm-Gg: AR+sD11Rni6ehic4QFdxX4DlG4WpIwL7a1jjMeLA/LOJZs1yC6vkBM38wm+NAYVTJ3z
	No1ff1m6MeaD8/oX8tHEFSKlpwx3z2oOol7D8ORoUIS3aZc2uzwVQuUVwIv3dKor4wYHuMpLNhe
	8larVxwExIJtoAjF5mDzJVNP+xihdxVyjp+Treg4/vk86MCdK/k0lbsCR5Md5ucdbKHRMoPGXAs
	LmTzQx2E42Bettd2wuKYoSB4Z88dusm68HD8oqa7tOoW2fNIh0OYnIi3cwYlDiV0dQv+LNZvLid
	tJMkCx9ooRTfkyHANaqJGElb8BnNUfQS80ssm+DpT4FStKHo9qF1bNaDsZQwgOMjQa6PvbuCv2t
	9cHXJIBiC6Xp7dkp27BnTMg==
X-Received: by 2002:a05:600c:3b10:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-49962462c19mr126524935e9.5.1786349476117;
        Mon, 10 Aug 2026 01:11:16 -0700 (PDT)
X-Received: by 2002:a05:600c:3b10:b0:495:3a52:71b1 with SMTP id 5b1f17b1804b1-49962462c19mr126524405e9.5.1786349475566;
        Mon, 10 Aug 2026 01:11:15 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-39-98.inter.net.il. [80.230.39.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm402319675e9.3.2026.08.10.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:11:14 -0700 (PDT)
Date: Mon, 10 Aug 2026 04:11:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: tools@kernel.org
Subject: Re: mlmmj version?
Message-ID: <20260810041013-mutt-send-email-mst@kernel.org>
References: <20260207053820-mutt-send-email-mst@kernel.org>
 <20260209-ethereal-beneficial-owl-1ec496@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260209-ethereal-beneficial-owl-1ec496@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h_GUzBCrU4GuZTXbUzT2cQnPJuDej6cfCsILKjPXtGk_1786349476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 09, 2026 at 01:30:01PM -0500, Konstantin Ryabitsev wrote:
> On Sat, Feb 07, 2026 at 05:40:09AM -0500, Michael S. Tsirkin wrote:
> > hello!
> > a recent mlmmj release (1.7.0) has a feature attractive for virtio MLs
> > (self moderation).
> > 
> > Curious whether lore uses some distro version, or self built, or what.
> 
> We'll build it for sure, but it's pending migration to RHEL10, so I don't want
> to change it on the current system until the migration has been completed. At
> that point we'll probably be running the latest released version.

Just wanted to ask if that migration completed, and what's the
mlmmj version now. Thanks!

> -- 
> KR

