Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D9012E55
	for <tools@linux.kernel.org>; Thu, 23 May 2024 15:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479784; cv=none; b=LDZ9DYBfJI2e/ndAj0dyk5Ub+j7j/n7lPLX5TYRXWyUpSpikxZFav6Uj5Rwu0s7RuSMSzLeAVXMgadVtSbAq0uc4NE+U+SsLH1CLZG5thEt5SrYHXjLPJxtpTtU+wUX+3u13DNWejISdzIsnvtUrr5i5O5P9aPyuxdVThd2+W20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479784; c=relaxed/simple;
	bh=7r91Oq4lfhb88M/4di/eCVfvmhElM24qSTzas/JlpLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEBrEHfAmeLLkgLSn8o7xWDRZeHh06ZiR2QnRVV33ExIHdupT/ysgyTf920YRVhPxHe3ZoHhh5S3uIpgdMp+UTlxZNJVMcpCpOYWJAWIdjXc3VG36AXAycRXJa9OmruXuWIr87ZgiTjLMH7kSLLuT+0GEAJcvv3d91F6a8Y50VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B6Rk+84w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B6Rk+84w"
Received: by smtp.kernel.org (Postfix)
	id E14C3C32782; Thu, 23 May 2024 15:56:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3268C3277B
	for <tools@kernel.org>; Thu, 23 May 2024 15:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3268C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716479781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7r91Oq4lfhb88M/4di/eCVfvmhElM24qSTzas/JlpLg=;
	b=B6Rk+84wA9+su86nbnft/sS7wgqGGS0BYWDPy7L5AqCXkJL5iNxHfcPR1v22Kvuvsrvf4g
	yHNTeEgh2K94QxmVSmLCNFZCkSUY+1iuudmFII1U814ELjM1jpUEB9UDSRq4jQrW84YHZ5
	jLUoMS7nnVFu6i9DCAsFuxdle/2lSeo=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-VZsfZygkOem7JiDTZE6cLw-1; Thu, 23 May 2024 11:56:20 -0400
X-MC-Unique: VZsfZygkOem7JiDTZE6cLw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-dee8315174dso4513223276.0
        for <tools@kernel.org>; Thu, 23 May 2024 08:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479778; x=1717084578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7r91Oq4lfhb88M/4di/eCVfvmhElM24qSTzas/JlpLg=;
        b=Eci5I8G/EezP6Ai3qvVmDbjkZ2uvfbTyfigyAPrfOZTvzk+IeyT0BK4zzZPH3Xe3al
         bzwjN6vX+rN2LgWLo//VnK47qarSAIjKJ1E8P0WtNWomuUtAAehtH5Iru+gUoWzHK3o1
         bTw0Ht5YsbQ19wY47FLWnlh9bV5kNK33Uc9Khco7+l9JRZOq/G527rtHzFOQia4yky3w
         7Zm82P25b7uHKC5kTpc0BNN6uhTHUAtddnOBrrMUzNbyaMVdJzCR8B2Wn8f3xHxWRY9/
         YZao7tcQdov1DyKmBOUpeFBosAys3g14kVtVD2sOkLEssK4yf3Hh7xJMPqX5LPt/MWSk
         Jl4w==
X-Gm-Message-State: AOJu0YwRV5tR8M9H9ihOpMQeDPQy+0AAnQotKFWtiO01vysLU1k6ZvQI
	M4HuxrPsXhGQ9piLrD/ItTtp7QteCgcUATLPId5t5FXo1AnpNTzmfwagPCyUuIFVL3e8ZVmYqE7
	ozEFsnsuuAgGTjogkBB/q4dbWdYyjKx6Wp9Q//UhxjvvQGY2Brwtvx4S7f3TyRXHiQWjYrrloxj
	f74nRI2YLMq6588l4O6QTnfxlqV4T6M4o=
X-Received: by 2002:a25:3c85:0:b0:df4:e1f0:eeda with SMTP id 3f1490d57ef6-df5422273ccmr1906111276.9.1716479778573;
        Thu, 23 May 2024 08:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENuOpOICPU6DCQFF8Omg9PeBOFybCdHSVqoP9rRvalnixHcD/LgX7poryFZd0IwxJIAwroSsJSwHhOl0oLqf0=
X-Received: by 2002:a25:3c85:0:b0:df4:e1f0:eeda with SMTP id
 3f1490d57ef6-df5422273ccmr1906088276.9.1716479778051; Thu, 23 May 2024
 08:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20240523143752.385810-1-jwakely@redhat.com> <20240523-strict-fortunate-buffalo-067b15@lemur>
In-Reply-To: <20240523-strict-fortunate-buffalo-067b15@lemur>
From: Jonathan Wakely <jwakely@redhat.com>
Date: Thu, 23 May 2024 16:56:01 +0100
Message-ID: <CACb0b4nqKbCVLueEtDXPHSYc5iQNUWN9AQXQQtWcdfu5o-p1ew@mail.gmail.com>
Subject: Re: [PATCH] main: Use inbox.sourceware.org for repos hosted there
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2024 at 16:16, Konstantin Ryabitsev wrote:
>
> On Thu, May 23, 2024 at 03:30:16PM GMT, Jonathan Wakely wrote:
> > Like the kernel, the GNU toolchain projects hosted on sourceware.org all
> > use email-based patch submission/review processes, and a number of
> > people are using b4 with inbox.sourceware.org now. This streamlines
> > things for those people.
> >
> > I don't know if this patch would be acceptable for b4. It's obviously
> > very specific to sourceware projects, but then the existing default is
> > very specific to the kernel! :)
>
> I understand the reason for this, but I'd much rather this was set in
> .b4-config, as it would obviously scale much better than hardcoding more
> and more projects into the source. Especially if origin URLs happen to
> change in the future.
>
> Have you considered submitting a change that includes a .b4-config into
> the repos?

I have now, at least for GCC:
https://inbox.sourceware.org/20240523155116.390918-1-jwakely@redhat.com

Thanks for considering the patch anyway.

