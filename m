Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75B39D6EF
	for <tools@linux.kernel.org>; Mon, 10 Aug 2026 08:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348818; cv=pass; b=d1BF1NBSjBKa8rWulhNNIwbV162Px9yop7EfIAxgqkNvp/2FZWn3POQud2fUJoggZby5nevAOOV93c29y7rjHCBc+OHs+cMGT49p8ioHi4mIzJXZrq082v93NLs+Qpq4NHSiMG0fnXuNeJA1ImVqoyH0vTPPPnAtlVpQgIUgNj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348818; c=relaxed/simple;
	bh=YZrQi4OffVoracoAalCeApbduX3VjhIMWjNHxLFZ8AM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=E7CGrvsah8VQSd+UaT6Y8dnkhe5cguXP/EKZa9F/xopfa4jKMWnyeVFokXqBKcZd27qcFgxUbdJ5oBkp/XKMgkImdA8CHD2hYx98uP9yMUvg5+GqF+YHz2/vEI9+H5v24wgXvc1hnSvHRkg/zVyOzmKyBa09Ar97qkNebdkE3oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R35crHUJ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R35crHUJ"
Received: by smtp.kernel.org (Postfix)
	id AB1561F00A3A; Mon, 10 Aug 2026 08:00:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786348816;
	b=viMBQXwDxfK/y/j5nY5AzqODLUes/GnEGuDKDfV8B8txgsIVOF2cFfteP6uLM52v3xsD
	 cPifaF927vCBWt9BrcMw3GZOZrphEobEQv85l6kw9V5KQ5h0yPrnodNGnTprt/Jxh7w39
	 TvBbJl5vPDadSXqfghM/NepivcMQUB6QOgZ1JjK0pgRk8CPVTz467v4pINIoUcY3wKfV5
	 KQMX3CAxFqlRA9zXi2JSJxuMmZN/l2M1ODzndlzacUOtjMuU+V1kdRLdsZio2Nh9/Nwak
	 tPhl6mTLmRmdFam6vHQiy65OHV++KS1dhsyVgtrRfl7y5tnoegOyRKoRHPL1ug7w6ig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786348816;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type;
	bh=YZrQi4OffVoracoAalCeApbduX3VjhIMWjNHxLFZ8AM=;
	b=IRN64EjJWGBf3ygAstK53xG12nYX2wTaog6Z3ax2py1TflOmntjUUOoHEsm3dd8Z2Xyu
	 7/KkCoKZyeW9y5P0N2XzOP31x7rpDPqNNJPvOAdblRofGQ8z33IAtwdFsNnhpaXwIxeV5
	 zbEkWz2il2DFJC8l+dupT+aQRqL/ShTeo+HPxUd4Z3H7xzHvXVfsLWLpSt7lUhFYz7fOj
	 s8M6J1DPDkjFz4c2ivWNKGiqWHuH3sx3Wq+IrMX35DfI+tbPEOxJ6P2P+3E7LOaAtG+ud
	 a6dKXQee5G9jJOClsLYOdOGgUoP+5JBnpd9ZBvVdDGmZ/HyXKpfwI/b9q47uzOaEnfQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R35crHUJ;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01D6E1F000E9
	for <tools@kernel.org>; Mon, 10 Aug 2026 08:00:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R35crHUJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 01D6E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786348815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=YZrQi4OffVoracoAalCeApbduX3VjhIMWjNHxLFZ8AM=;
	b=R35crHUJ+OblUKC9TAlp0BOh3kvXmhmqzsU5q5WfnHotnluh1Lrf6XbIFO7f0a1qmJerPm
	KEN/qOwa0f+CzhHllGyofxqGDM5zv2fVkfP8gZ1vzCJ0aqpv+EngWMEWBae6QKJV+/apQJ
	jDLeYxT98yVpo9x59pmKAw6RA6BGtbU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-S9dPYMxmMZCiYXXD8CkN_w-1; Mon, 10 Aug 2026 04:00:13 -0400
X-MC-Unique: S9dPYMxmMZCiYXXD8CkN_w-1
X-Mimecast-MFC-AGG-ID: S9dPYMxmMZCiYXXD8CkN_w_1786348813
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e048a801dso2509794b3a.3
        for <tools@kernel.org>; Mon, 10 Aug 2026 01:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786348813; x=1786953613;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZrQi4OffVoracoAalCeApbduX3VjhIMWjNHxLFZ8AM=;
        b=IwTNMANzLZGV01z9V2B1NTnkYDSbIhF8003p7n0WiZigl8TPVUh+m9GEWbyRwEqEmB
         3yYj1bu0STAOO5YVly/hzong5CvhRQDDE6BGBJQP6zJB35uTqnlsCba3SO61Z4hK8UIy
         dEc7t80LPEUht75HpVOOZAEUFnU0p3i/mzk8X/TJYG7XYtCqz6iRmFnLBD7khoAlW2ZS
         EyYJcPfs9fxj8Iyoci9Wg169A3Ja4lWuX8Wr4uLh01o4IL3kfWC6BMpFMvjQc027MhFG
         WVs2UuitWHxIv5lB164rTD4twNxGLXeXbfWf0pz2OEiDIP2/YAVQgsydFgCG/JQ9RqUO
         0QHA==
X-Forwarded-Encrypted: i=1; AHgh+RoipLQ269ahrU9ebDelCDO9AgROyVWxCM/qiIMP30+yp9TqUI/RcDH0igbbBc1jL3/oIZcrqg==@kernel.org
X-Gm-Message-State: AOJu0YzoxCM0SwO04KnT/U2Oa8Z6+xfOInIFiDjKZFYwaJTapo5CCh6G
	mdEqlaeoW6lNpITjGsW8yj6+BbV0k2vePb7u1t45rr5NnSx7BGqKk8tAgCi2XRjuwI7pesZk5PY
	KWuu7alqguyYh7WFcV2MB2Q+VrA1QOfeDFhCl6y7CIHYjncPKUEaA8J7QdAP8Fsp0+jH4rZTOrM
	c7CJ8nJgGDhPyqebkm1zg2GCu1QT5eKWApJhJh/Q==
X-Gm-Gg: AR+sD12gfULOqEKnotCrpWNTFoNhFpVF5kyykdJKFSa53hGh+mHMY3NA1KmFqfs7+Og
	Rmp2/8H6ST0lt/3kSYNanGmbQH4aJ2brAcDKgkAIMiv6pLXEA+pjqeV+rBGBWQO7WISqBiXf+M2
	S1LU9iZ/OQy2boQ/KXu9gLovjh+2lfra64diUjxc+u6iOWT8JvOKH4yoK/nBtlsaPCyoiXvgFKg
	zZDtgMX0BB6q+hJRVnmKciMZcZFFnqPiGJkHyMFiN/Xw/5/M02QP8+qEn3tAZh5BEzy93ykby16
	Tg==
X-Received: by 2002:a05:6a00:3d54:b0:847:926c:582c with SMTP id d2e1a72fcca58-84f2e01410emr43781204b3a.29.1786348812664;
        Mon, 10 Aug 2026 01:00:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d54:b0:847:926c:582c with SMTP id
 d2e1a72fcca58-84f2e01410emr43781124b3a.29.1786348812140; Mon, 10 Aug 2026
 01:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 10 Aug 2026 11:59:59 +0400
X-Gm-Features: AUfX_mxkKDpG51_U-_s7f1qMiAgV-U7sIj6cc6r9WCp2u0e5W_9D4sWPmh_IQ-o
Message-ID: <CAMxuvawkMqDYVP6T85+s6FwDzp5B33eWNHjkjoAoW+C4OnuZYQ@mail.gmail.com>
Subject: b4 filters out Fixes: lines
To: konstantin@linuxfoundation.org, tools@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7taSdR8Id3OpMNEzniPAa1oUduTvmRShf1xPc4617uo_1786348813
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Since commit dccab10473b5 ("trailers: reject malformed Fixes: trailer
values"), b4 filters out anything that is not a commit hash-like line.
But various projects, such as QEMU, use Fixes: lines to reference CVE#
and sometime report/issue URLs. Can we relax the validation? Should we
make this configurable?

Thanks,

