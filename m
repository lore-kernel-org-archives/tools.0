Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54A3F0A94
	for <tools@linux.kernel.org>; Fri, 15 May 2026 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778833367; cv=none; b=aLVA5jERT3cQjZO5vlAI8NGvL7nHVJA5blI06FYdtHQU5OlQAYMQ53wRVVH9zgCy9rcXLEQOmZk2qM4mfWLc4SroMF2QLRWt003duX6ej34X8Iwgq2yrwPT0F3VW0m1yWbp2Z/0aE1BmBUa2//77xN1Fyqj2xR2B+bS/iRZSvis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778833367; c=relaxed/simple;
	bh=muUh8PonYbwa4f3hHDULcvtPCEbcdn9uYfbt5ylCbUo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egpJejDCqwQW1sLYhGUE2eh9q6V880jBr3Ymckef7413J10w351YxqVeDNCF5dj0rUupqdJJ+bldXvYyL3aYERfOBA4Qpvx0EoeZaTwaTGQ3T+g2+R34nWavFnYn1nGYVV6fJomRi4ZyUceRcD6bZ2vXYEFGG9QkHqIFmAoiIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2b8xbKE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdi2SV1T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2b8xbKE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdi2SV1T"
Received: by smtp.kernel.org (Postfix)
	id C5F79C2BCC7; Fri, 15 May 2026 08:22:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79163C2BCB8
	for <tools@kernel.org>; Fri, 15 May 2026 08:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79163C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778833365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=DFuH2v7tvh6+i7n2i56s2kVOaERNZ0slp9FQ/QP1JYI=;
	b=Q2b8xbKEUHAPJ069qFGqW7ArM55qdJXpgTYP8r7N3c6zQFq3sKMbGDZTsC6nw9X1Z3sFWc
	vXN5NY60rJ3R3/O8T0p+mOSggv8l+gcn+uCk1FQBXgpyjfCEvu/XFtE4z2cXQnCISMQp6L
	X+QIyD1YJKo5z1Z1aXp8B+xsAiLyooA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-NgVB4wkxM5mwTqfRzVIBtQ-1; Fri, 15 May 2026 04:22:43 -0400
X-MC-Unique: NgVB4wkxM5mwTqfRzVIBtQ-1
X-Mimecast-MFC-AGG-ID: NgVB4wkxM5mwTqfRzVIBtQ_1778833362
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45e55c44ac1so934724f8f.0
        for <tools@kernel.org>; Fri, 15 May 2026 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778833362; x=1779438162; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFuH2v7tvh6+i7n2i56s2kVOaERNZ0slp9FQ/QP1JYI=;
        b=cdi2SV1TAaB5TUwv5htrpRKMN7bargmN0CG8RkDgbbRCDeyA0PGjxLe1gDK6xzGpOD
         LjXjMQRYFogryHXeLO9EWvJSR5jvCkGFwrpaVxZWXVFatLE6l6RPRAS4tHLZdHP/yimy
         IkT2MG8RSFUp0J+8HIX37WzyGsPNVQUXGZIVYqmazwoplwkqlOX+D1Xcw8G4R6eDQqpN
         XXjzjyDHvlGjct2PVFdCicoxgMzJojPKtNLweLnR3nXpPd7Dcnso12QlACCwe46HG8CH
         gWYD1rUocP8uXFQxGU4NWXTR+/iC0NZKGMvIMPZMulcPgShLCeXXoBJFmI1e1qMd0Et+
         glrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778833362; x=1779438162;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFuH2v7tvh6+i7n2i56s2kVOaERNZ0slp9FQ/QP1JYI=;
        b=IG/vgczdKzJWvQJam5HzrmwdmUXrG6lK0wVQcxqeARU7Je8i42EB1k/ub76Bf9gacI
         aXSIk/m5zSVbAyln9iZbdX7m0cTFasBCZkYsxkQZt5WSag3Fr9Qf5AkuCmaRausrMGpm
         qfHIvdl5H27incSFVrPP/F06VHodmOiGwbxoasp3RaPWvA6oaVHIRMIjNRpIGSUngzD6
         tNH7hdk+OZqvrObfdXQnIaL/aW+4NtOfcWdCXfSN8EyNkao/P+yMVrVh6IY+6L+lbw3r
         ZIxSpdU4ZuqeUo9+NfSMXtYN5j2s2Td84+I0KhNN8vNCgOHa4rJibNUM43NxqoMthB62
         7oIg==
X-Gm-Message-State: AOJu0YyNxJXbtCsmibUtOAwzZ4eZPAcmWKcnwFOPFPkS3uHOpzyDou5d
	O/0kVO1Tt36W1Xi3dlqh3E2mY4rOVg3jK9smu+zAzZITs8fxdkcTIJ6g+BapkLljOHFOdB4BbAU
	RiimI2Fpb/+IOhYSv2CNmHGkHd0jIJs9cuG3uoE5xZFmNb8nPb/sRd3L5kqBoBUorQU9+Ul8mYH
	0tJSslLPWZp6+S0LKW4obIP43JRQTk7Pqe
X-Gm-Gg: Acq92OHopToVsw5eKt3slHDMZTX/vIhQsFrqhMS8gryvGAw2uPRgfhUDsv/8F7c9fFU
	iUJ2GxenrXFe+5FY+rfNUK4LIPETaljeZjanPznafwomQ7DA9EBdMuJQdMMJbFtNMJ6SItkqYYO
	KAXvrM06MAId1IQC7tyIV0PlshBkrmQv3cR/mXzfUn+7JNT3brnUx190wwsdmhrPENmumklv5oP
	ArO4M9jkA5fiAKV33mfQWlMut61lMBgpbh4iqZUG3wCARTtrhWWtuO1aqYIs73GTN8r9NlobChx
	qWJj7QiLZhCJTix/rQj2jnZWJcW3v3WJ2FJWacVp1xTjJt9jRL3s031Lj3UDuMhs+RtS0dKUnKi
	c3dSSkKFOsjcv++QVoUs=
X-Received: by 2002:a5d:5d13:0:b0:43d:7a97:78a2 with SMTP id ffacd0b85a97d-45e5c5e3384mr3749917f8f.28.1778833361654;
        Fri, 15 May 2026 01:22:41 -0700 (PDT)
X-Received: by 2002:a5d:5d13:0:b0:43d:7a97:78a2 with SMTP id ffacd0b85a97d-45e5c5e3384mr3749847f8f.28.1778833360793;
        Fri, 15 May 2026 01:22:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902:ca7f:54ff:fe01:374c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm12377057f8f.11.2026.05.15.01.22.40
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:22:40 -0700 (PDT)
Date: Fri, 15 May 2026 10:22:39 +0200
From: Maxime Ripard <mripard@redhat.com>
To: tools@kernel.org
Subject: b4 cannot be built without tui extra?
Message-ID: <20260515-uber-pigeon-of-opportunity-c3bb74@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ic4bgspiv33xpvky"
Content-Disposition: inline


--ic4bgspiv33xpvky
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: b4 cannot be built without tui extra?
MIME-Version: 1.0

Hi Konstantin,

I've been trying to update the b4 fedora package to 0.15.* and all
releases so far seem to error out when building without the tui extra:

+ /usr/bin/python3 -sP /usr/lib/rpm/redhat/import_all_modules.py -f /builddir/build/BUILD/python-b4-0.15.2-build/python-b4-0.15.2-1.fc45.x86_64-pyproject-modules
Check import: b4
Check import: b4.command
Check import: b4.diff
Check import: b4.dig
Check import: b4.ez
Check import: b4.kr
Check import: b4.mbox
Check import: b4.pr
Check import: b4.review
Check import: b4.review.checks
Check import: b4.review.messages
Check import: b4.review.tracking
Check import: b4.review_tui
Traceback (most recent call last):
  File "/usr/lib/rpm/redhat/import_all_modules.py", line 106, in import_modules
    importlib.import_module(module)
    ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^
  File "/usr/lib64/python3.14/importlib/__init__.py", line 88, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
           ~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "<frozen importlib._bootstrap>", line 1406, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1371, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1342, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 938, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 759, in exec_module
  File "<frozen importlib._bootstrap>", line 491, in _call_with_frames_removed
  File "/builddir/build/BUILD/python-b4-0.15.2-build/BUILDROOT/usr/lib/python3.14/site-packages/b4/review_tui/__init__.py", line 1, in <module>
    from b4.review_tui._common import (
    ...<4 lines>...
    )
  File "/builddir/build/BUILD/python-b4-0.15.2-build/BUILDROOT/usr/lib/python3.14/site-packages/b4/review_tui/_common.py", line 27, in <module>
    from textual.app import ComposeResult
ModuleNotFoundError: No module named 'textual'
Check import: b4.ty
Failed to import: b4.review_tui
error: Bad exit status from /var/tmp/rpm-tmp.rHqgoF (%check)
    Bad exit status from /var/tmp/rpm-tmp.rHqgoF (%check)

it looks like b4/review_tui is included even if the extra isn't
selected, which would not install textual?

Maxime

--ic4bgspiv33xpvky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCagbXzwAKCRAnX84Zoj2+
dn62AX91QC45+wBcSuOejYX0DkNvQhOe+dfRWIFeihGCm+xp6EeYpSCcu6y/zCGh
LVvz4OwBf3W20ezwxr2ruzisfZjfM78Uvyfy3LW1PHMzpp6GaLhsdFObM7amLxT2
YkbVLqyCeA==
=GwXb
-----END PGP SIGNATURE-----

--ic4bgspiv33xpvky--

