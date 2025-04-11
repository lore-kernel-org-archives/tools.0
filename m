Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E72C80
	for <tools@linux.kernel.org>; Fri, 11 Apr 2025 16:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388138; cv=none; b=oWeX3LgTqzmcoSFioZY1nWOSKOCMz2RmimIMfQykpMIvyDJ99AqS+5lcEH/rlZ8jD1zg5F7+ua9+tUDgWj6SUkLUhHTB6u+CXAfzT2rzvR4TerLzC3FXgTrV9K3cXU9mbUHxarpaFzFeg/NAqnFfSWwRzjrHfKW7+uzYnrFn9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388138; c=relaxed/simple;
	bh=wY0uI32tgF7eXy9UQqkrTUad4HxYRsF2K8VNAYDHmoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyPorEo/w2GLjtLHTHrEEE2Aq+NU6w6ivpksEnUh/oVlyEyUCOWDVGPCWavIa1hoUWeaskoZ6Wphxg6z05Wk+eaSaqbo4pj0IFwhSdf/AcP6LP34SCPEKDi/t5gieGk/ZYapSecAagZsryQqO4AF876YK34wHlTrNXyC7lporhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ga3B0B1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ga3B0B1G"
Received: by smtp.kernel.org (Postfix)
	id 653E6C4CEE9; Fri, 11 Apr 2025 16:15:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B19C4CEE2
	for <tools@kernel.org>; Fri, 11 Apr 2025 16:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23B19C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1365896f8f.0
        for <tools@kernel.org>; Fri, 11 Apr 2025 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744388133; x=1744992933; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjt77reChRK3vkvNEE+8cqlSxD6R4vVCuQBY47t1VFU=;
        b=ga3B0B1GE2ntsa7YgS1gA9aQXIUHrlcuIyEe0Fgq1Ua3isZbT1bR0qX6EOAAExmRHp
         yrvlAR7EC8L5LeOwE4jGJiNgiGBB3iVeBkiSpAy1fy3rpcKufY0yBxdcxby1NRd024S7
         iqcAWPFnoccuwUUGCa0vtwMsTxDqqmTO2Bf+PDB/JXthf+h6o7/c1mHxGTeI2bNsLtC+
         /EnVchb9BEyZgcbnziwNpPlhHnMJowmmvTtJJGu0/Ekozp5mXfCMS6uZZvIVHBdiuSO5
         2pBWUfKW2gBPAsmF/FS5t9tFb61uyYoz7/bbw3CPxEuNrXTraFhP50/pCu8NkrLArHgb
         7BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388133; x=1744992933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjt77reChRK3vkvNEE+8cqlSxD6R4vVCuQBY47t1VFU=;
        b=Vj8XjpgbcbDxD3M+Cuz6qhDhSmSw6umGsQq5LGZtSW/5vOwmRaEqsf0kwDdu+OfXJr
         p6abf/9mGj5i6POxuC8UYv0PUEbRxuBJ/SR4praLZZ9Sr2ejB/PQgx7EVJBO+4j2G8sn
         Guo40pW7tQkkOdekdVWtf1DeEFH1nretIp0Ftm6MAjRA0wjfpu+QCISAq+XQzK9SFztH
         ZHrma9qDz9OzY2FvpuYdmQbX33fMaNs8QnhciPGh0Rglu5h/LMwhStNfZaN3iuZ5c9xH
         OKJz3FZpDllEP3Ih3dAXfo8yPcKQCPagCTtc7ASea1qiQuN8JKyjF3jtXyBuKDCrMjFe
         Pwjg==
X-Gm-Message-State: AOJu0YwgxiSvhgSbhUXe4YEHE1koAiikLFqUONfOKmHba6vgWiE65uHL
	7D12o5HR0xR5q1dbF/uwAPO3GSqvsiFuLcbmMFztFGyhDKFqUYeOyW3rakOHQeQ=
X-Gm-Gg: ASbGncshPfGkvPI3BAbS5PzNkwiQIo79cnWuvvJT4MUwS97ZFijt3mq1YFJis1QaOdV
	ANfOGbw78pFFVsVOsMV4J02zd3dQKXoKRRszpaOMgo9wfrkb5O+1GKtcuMUXNOpeX7zLU6xOLx3
	4rQRUBPwtrnJTN82wPlGvQFA5Gj77nddzFOdV8tOypCv5DtjA8+b/oLsPaSGZaBO5lWtVGwj8EF
	rn/WOBRTEnXhEvc4GFNspKbu2iuMyB8gAmkkLe+wtiYvq8Q/DTieIwMPOs/yGkqLm958ClRmsW3
	8SoqEpwGAQTV1dZvOSmLXFPY7L/LbNt7pQMxaPU1XyQ0Vm4e5qPIrC6SALUQTklzQ7r7aqpy0Zx
	sMkpKopg=
X-Google-Smtp-Source: AGHT+IHYesmHoDZr31MdKv8cOgrYkG0t4AsXE1RaubKfB3KdMs7i05ZB+Q3s247to09moZRwRLpD0g==
X-Received: by 2002:a5d:5886:0:b0:39c:30d8:ef9c with SMTP id ffacd0b85a97d-39ea5212b71mr3112358f8f.24.1744388133288;
        Fri, 11 Apr 2025 09:15:33 -0700 (PDT)
Received: from localhost (p200300f65f13aa0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:aa04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2066d109sm93044215e9.20.2025.04.11.09.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:15:32 -0700 (PDT)
Date: Fri, 11 Apr 2025 18:15:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
Message-ID: <kqn4gqirnfplzcmmfwl6t74pbkjeeyllvms3cswv6tic2w2l5b@fiu3tccrks5o>
References: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cbebnkzv5ahl4xsd"
Content-Disposition: inline
In-Reply-To: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>


--cbebnkzv5ahl4xsd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
MIME-Version: 1.0

On Thu, Apr 10, 2025 at 04:51:36PM -0400, Konstantin Ryabitsev wrote:
> +        # Is there already a key file in place?
> +        key_changed = False
>          if os.path.exists(keyout):
>              # Load it up and see if it's different
>              with open(keyout, 'rb') as fin:
>                  old_keyexport = fin.read()
> -                if old_keyexport.find(keydata) > 0 and old_keyexport.find(key_paths_repr) > 0:
> -                    logger.debug('No changes for %s', kid)
> -                    continue
> -
> -        # Now, export the header
> -        args = ['--list-options', 'show-notations', '--list-options',
> -                'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
> -        header = wotmate.gpg_run_command(args, with_colons=False)
> -        keyexport = header + b'\n\n' + key_paths_repr + b'\n\n' + keydata + b'\n'
> -
> -        if not wotmate.lint(keydata):
> -            logger.debug('Skipping %s due to bad linter results', kid)
> +                if keydata not in old_keyexport:
> +                    key_changed = True
> +                    logger.debug('Key changes detected for %s', kid)

There is a bug here. If `not os.path.exists(keyout)` we need key_changed
= True.

Best regards
Uwe

--cbebnkzv5ahl4xsd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf5QCEACgkQj4D7WH0S
/k5fPAf+PCp5vBTlv/CLy/2KTfmx9diWpACNGLtwqSRFJYt6PF+2SCgqDHmWr/5o
J6rTRvJ76FpL9+xvRPGMqRMbx2GFtOumgOoSS37f7aOLwPMtsD7u9J7ILPEZDs0w
VY3Cwv8V8m+woN1HQ/8LpUDY5sk4hxT0aQy2sq4zo9mXShisuOcm3eQRJJE9Q/Vh
wmyMCphLcN30/pTHvI8rSHkYOKMJCxvGRTRrpp4Bj/xpzjn8z91MuL2w9oFGGuh1
Kpd85Il0Iwhws1bKJEC8KdEAtK4ikb0rdFIgm7hkkrq0vfSfgS5RiabIuvG5O+Wc
DULxa1VEjION2FbwAQua7KzITFzS9w==
=wW4z
-----END PGP SIGNATURE-----

--cbebnkzv5ahl4xsd--
