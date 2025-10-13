Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0DB248F4F
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358113; cv=none; b=MwpUHhVpxkTyvAbVKeebLc2HXh/jm6ipQDr1vgBgKFm+OYxnCya8mxtmbGuzwNTGKriHlYq2qfxKWcf9dOgDtvdhEH6UI+stt+HQZIl/K8jmsm9NqojFFuzocZgnFt30P/qLEgr1eoXT09hWpFs1NMyCL95dKIWLufTfbwXOcY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358113; c=relaxed/simple;
	bh=8FZYwzDBNqrjavLtD/2FOC6qR5wA2qfLhuttbbcwywY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LI1Q/dmJuCg+0bDZSv86UeQKrMbaua8dVJAeCdzUDZqFM/iPiMcaOxtFfujNtNCDmTcs23XS/Xkk1aAxEW7gw5Aa22fxcgC7uOFkx+znwuawBB4ojt29Is8cGVRTDxrK41zW6z7IW6rZVjtXpFzlPTAfWqtjuNZ18o5OoqF5Uvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hBBnH9aq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hBBnH9aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760358110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nrwE2CHGZjawt/LUao3wUg6uCzVjgO+00OFxqr5kFGI=;
	b=hBBnH9aqs2PYvBrN379TnC/hflkKHbqqDJArEPoImb3iJQI2xQepr2Nj7RfCDTn/bnYFrr
	1yfnqvoN/xD9tQHGkiKhEfUA3A3n7iPT38TN6qi5W6q5IunJQeytTnhDbJlji4OqllOiO2
	tYqoAjwLMq2/MWz7SI53CN+CkPtwMrU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-PsLP-YyjPTO0eOTNChO5Vw-1; Mon, 13 Oct 2025 08:21:49 -0400
X-MC-Unique: PsLP-YyjPTO0eOTNChO5Vw-1
X-Mimecast-MFC-AGG-ID: PsLP-YyjPTO0eOTNChO5Vw_1760358108
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso34118505e9.2
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 05:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358108; x=1760962908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrwE2CHGZjawt/LUao3wUg6uCzVjgO+00OFxqr5kFGI=;
        b=jFCDePSDMYEdCsE+joQpcT43P7fvAvNxj7/DPBmnlMNNLEZTq4MBPSG6+2yQ/xLt/b
         ETygk2a0Op07CgFXUyCyXI2YCGSjf7rNRjr20aNqWWCP42Kj45T17R1koO7E/ooXaptq
         zWtMPyRLgIDbg2lNMfOzyqTqMwIGx1y0Jnqcu3rStJ+0mMIGWGmPwW5/ctViAn2SEx1f
         vEN32LQAtMXmpMAIkav87xe6HuujSg9tMO/EJnfCn4rD6OgC22fDv9vULtGaiBPFKXIB
         mxxOS4d37b8uLQsBEVURUDwggZ2tQdcjaULAJm67/Y7GOkNHF0pb2/0LEBV7r8ub3Bql
         1bww==
X-Forwarded-Encrypted: i=1; AJvYcCXLa5lpbw1Og8AocojrW4+ohOMjajty2wyy4d+xnHuRRRjfVGDCfWIIeDqo7GZvIAn0f+2iQg==@linux.kernel.org
X-Gm-Message-State: AOJu0Yxq4IdJk70AlCosyUIGT1tOJ1VIfLbMY+4ht+TRYaePO1/Xo+42
	1A85arOF5QrmwPz5Y5Ad29JzwYquogeCszIY4LC5X5Lc36S3X54d1F3l5CFBx+gI4JbR19Pc94k
	06yRmPgg6mNPpYeKzeWq1KOh4IBYIR5ewHWihg10aKLHxuKpu14tbClAHxQ==
X-Gm-Gg: ASbGncsfYBLxzwgVFx076NoFq7OauwIGw0Lny2X6Xs9RHLi9LOMJPgS/FLMXw4qaEYg
	0cbl0lAvCBMRjASF4kO6dWlOsH7TqXxQQlv8rzb2UaE4Tj8/xFTwaDeDB36fd2yZREUmTm3uV/K
	lG3bnh5jaCNLFWa4J9oHAzc2C2paGiDTZsGJr9ajQG3xlNUIfuk2cTc1Ej8nlJ1a8FUp3fQYJ4B
	hVXIo1zfSp+CKH5cOl6eMsQEkbpUii7EGBjVVC8byy5HOUVF3gvczf0XSxLWPXIxEEML32KUzg0
	sACyIRftGvDdL4CRP7DariQd7n4cpfBmkQ==
X-Received: by 2002:a05:600c:608d:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-46fa9a8b2aemr140866635e9.4.1760358107995;
        Mon, 13 Oct 2025 05:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsa8GcTh1kV8gnzPiOnOujLzDw7XMHBVi25+me8dz4tedKg6BS0NOy6O7U/+M1mCsicK0+7A==
X-Received: by 2002:a05:600c:608d:b0:46e:6d5f:f59 with SMTP id 5b1f17b1804b1-46fa9a8b2aemr140866485e9.4.1760358107514;
        Mon, 13 Oct 2025 05:21:47 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49c4027sm180919885e9.17.2025.10.13.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:21:47 -0700 (PDT)
Date: Mon, 13 Oct 2025 08:21:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
	tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013081536-mutt-send-email-mst@kernel.org>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VbwsaRv4cJ2jzCNO9wvHRgnL7jxkilet-O0Ngb1MCTI_1760358108
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 11, 2025 at 07:59:32AM +0200, Paolo Bonzini wrote:
> Linus complained about Message-Id too in the past, but if Linus does
> not like Link or Message-Id then fine, but can we please take into
> account that he is quite obviously unique among kernel developers? ;)

I missed where he complained about Message-Id btw. 

-- 
MST

