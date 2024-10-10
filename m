Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293E01BFE0F
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 11:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728559377; cv=none; b=OBIPxtieMiGawV/Pv0uhrzvtbs9AR+cgyHukSNv5h+AgifabkBtbiFEVAr1cruon3YZ/TSDEU8EZ0mh2IqX7vAt/OUh0hPWK9YKaqIVIT3EfVfWLXgQi08E90t+f4NyW1BoC/01FeL04Gy/y2gpRPf90hL2v15WKtxCjIzFI754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728559377; c=relaxed/simple;
	bh=Aq38bSGKbXQlN5Gwzw9TIWiUO58UKzGiaHWdmAUhFWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XYIGZioltvyl8FmSGOtwVBZTsf4A0y+ZJvG0o8J+uNgjhHNa+QopPjD3B/OlupxSxOzqtpdDndg/1Cc5VmEYMK2GgbtkkxzKjj7PMmyb0VOlSzwnAAFbXVf8qRqLqTjVDXS4RkAsh/o8dNQX5otq8xCUoHcs1fhNnO+R2PnDM3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lr2gNPWN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lr2gNPWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728559375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Aq38bSGKbXQlN5Gwzw9TIWiUO58UKzGiaHWdmAUhFWk=;
	b=Lr2gNPWN7whJqtIkQfjFQftKtC51f9kAiOCWRQbufG442eyADRQ8heQEGEwYVppsXlqWUd
	xDX81JVTLuqjJDCZHrfj2BN5ySS5JF0BqqqqsQVLQE4OkPpxEdnt6du0KHS+DGZ6fdeyEA
	gLuCeFS/s5MVGHeyp/z4eIwcxyTcdBw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-CXYbubMnMfCsa4ttoNffxQ-1; Thu, 10 Oct 2024 07:22:54 -0400
X-MC-Unique: CXYbubMnMfCsa4ttoNffxQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a994dbc405fso54646766b.2
        for <tools@linux.kernel.org>; Thu, 10 Oct 2024 04:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728559373; x=1729164173;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aq38bSGKbXQlN5Gwzw9TIWiUO58UKzGiaHWdmAUhFWk=;
        b=oSzcp8qCq7IXyQBWB/ScNsHQcqPpAzpog3Bz5ukN8bWcEHA3PuRgJtWIteMl0YVdyl
         jPAiZ3RD6FDX9G/ejhbVK/yw+U3n4zg6Ns/ZsSPQlSKZFwJbNnzrPooceXjoDf/kYUH2
         NvmS0iVRa8JZUmsbOzyb8EdP5zuZHbV1JaSbM+DmnwkMxQXfUZOJpCVquxPUV8GO22vr
         JyM6tA2ePl83sDC7yp0ZSpRVUxg0snjTWQnjiWXpqVy+Q3j57lxXG/0L3ZvruuvF4pzV
         L1a9yFPrDlC46JrENfizzfunYMXM0OVif2OxRwrZC35kbdncH8PvKIQByBrlRB7H2d3J
         D3Kw==
X-Gm-Message-State: AOJu0YwjPsEWL9xRM91/ltl0iEY1IPCzaC8ns9LLUg8nZX7jTaALwrCv
	BVetfVA8jU2yjf8oj2Lx5/DwZmpbdiNeLRJGYOrd6kUmjeUj5ojivTJP4dd29M/nd0uDoHL3m9Z
	JzK3M9uKFLxEiWS/n53P0fUtd9e0KsCOw8OKd3SJiO70DolFqYx6vPNRnMZY+iT1aRWy2nVXXL3
	vJQknsMQbSOD3yP2f62gz4zmJXB11//AmJ
X-Received: by 2002:a17:907:7206:b0:a99:509b:f524 with SMTP id a640c23a62f3a-a998d3496d3mr494644966b.57.1728559372664;
        Thu, 10 Oct 2024 04:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeGexCIctrNK8hyfiufRHwLGxYxbbvw1IcuCk390AhyASTn3mv1OQpedEMEGEm7AZKuApieQ==
X-Received: by 2002:a17:907:7206:b0:a99:509b:f524 with SMTP id a640c23a62f3a-a998d3496d3mr494642266b.57.1728559372214;
        Thu, 10 Oct 2024 04:22:52 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80cb013sm75063466b.131.2024.10.10.04.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 04:22:51 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 4772915F3E7D; Thu, 10 Oct 2024 13:22:50 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 feature request: run command before rewriting history
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 10 Oct 2024 13:22:50 +0200
Message-ID: <87ttdkrylx.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Hi Konstantin

I recently started switching my workflow over to 'b4 prep' for preparing
patches, and am loving the workflow. Thanks a lot for working on this!

However, I ran into one little snag, that I'm hoping could be fixed with
a new b4 feature: I am also a big fan of 'stacked git' (stgit)[0], and
often use that instead of 'rebase -i' when preparing a series for
submission.

So naturally, I want to combine 'b4 prep' with stgit. The problem here
is that stgit maintains its own state for the branches it manages, and
gets awfully confused if the git history is rewritten underneath it.
It's still possible to use it with 'b4 prep', as long as I remember to
do 'stg commit --all' before running any of the b4 commands. And, well,
guess what I already forgot several times? :)

So, my feature request is this: add support to b4 for a hook command
that is executed before any operation that will rewrite history - and
abort the rewriting if the command fails. That way, I can make sure that
I don't forget to clear the stgit state before running b4, saving me
from the pain of dealing with a confused tool.

Do you think this would be feasible to implement?

Many thanks!

-Toke

[0] https://stacked-git.github.io/

