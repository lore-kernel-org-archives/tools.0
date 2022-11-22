Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8B71229D
	for <tools@linux.kernel.org>; Tue, 22 Nov 2022 20:00:53 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id w9so9996612qtv.13
        for <tools@linux.kernel.org>; Tue, 22 Nov 2022 12:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+FsMO/2JpkfyBgAi+AOZstZ6QuDiDvo/MsZpHPZOgU=;
        b=hIXCIPCwz8GJ7NMHAwhyfl5/AvZ3nTFHGhQ7bursSZ5PE5Xqo+qFbHE8s+7yeqAMWH
         dZwGBRCCAknsaD2QJTDclK72UVy9J614jxqpaCaIUro7CgbBk4lffOB1TC4WyRiSkNoq
         NlOt6gggd4EI0cs/Ewabe4FhzYew1U1nncKl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+FsMO/2JpkfyBgAi+AOZstZ6QuDiDvo/MsZpHPZOgU=;
        b=76V8h8R74fHPIZUStCLbggf68e6jz8fTY5aR84sFphbNPBHDvlgxYYGRfSyoObHtuQ
         L8lCrKxWG7KeLO3ZJDBR2wz1zv/2ftUhy+61+WkCNCcLpMIvWCXb/ik6EtLquKuQVVy6
         Qc1A4LVU7ZyeJ081FKwkvEaWTzZnu4hXQQ6aJzjsefKT1MjLAn0RDhQEeIcxgmsjRfsi
         TqV/M/rOvh0kskVDv9qFnnZUyxpYH2Da1Am/AsLgUWWljKxoR2sfDfwPfB6yVsCqDqMv
         tjjp51euHeq402ec8HiXzMTy3vSLyOQiwqoBkpdF7b/1d4VFSqqDVBoUR/F8ItuEjZAb
         8sQg==
X-Gm-Message-State: ANoB5pmDt9TO0qmla/3bLdIE2yMH/EMZJsBI0OBXHlF37j8C/ZvjtEUx
	hcqh5PwEzLb9xuRwcFKXMuRwHHpyrIPChA==
X-Google-Smtp-Source: AA0mqf4Vw3bB3ATg9X41eYtbPF9Ns4bEwBWxDUreEQyEtck5jH4FMoPN+maihXKTdUN1iE1YaslZoA==
X-Received: by 2002:ac8:7513:0:b0:3a5:4442:80fa with SMTP id u19-20020ac87513000000b003a5444280famr10047248qtq.233.1669147251940;
        Tue, 22 Nov 2022 12:00:51 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y19-20020a05620a44d300b006f9f3c0c63csm11202014qkp.32.2022.11.22.12.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:00:51 -0800 (PST)
Date: Tue, 22 Nov 2022 15:00:49 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: tools@linux.kernel.org
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly
 smtp provider anyone?)
Message-ID: <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
References: <1bc45775-0667-01f8-36e1-9f65d3081092@tronnes.org>
 <20221121151922.jaal6ym7z2ejju4q@houat>
 <de12952f-8346-8995-236d-69dcb70f19f6@tronnes.org>
 <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>

On Tue, Nov 22, 2022 at 08:48:27PM +0100, Noralf Trønnes wrote:
> > This is very strange, because this is literally the code in question:
> > 
> >     req = {
> >         'action': 'auth-verify',
> >         'msg': bdata.encode(),
> >     }
> >     logger.info('Submitting verification to %s', endpoint)
> >     ses = b4.get_requests_session()
> >     res = ses.post(endpoint, json=req)
> > 
> > I don't see where "Object of type bytes" would come from. Can you possibly
> > insert the following above the `res = ses.post` line:
> > 
> >     logger.debug('endpoint=%s, req=%s', endpoint, req)
> > 
> 
> $ b4 -d send --web-auth-verify <challenge>
> Running git --no-pager rev-parse --show-toplevel
> Running git --no-pager config -z --get-regexp b4\..*
> Running git --no-pager config -z --get-regexp gpg\..*
> Running git --no-pager config -z --get-regexp user\..*
> Signing challenge
> Submitting verification to https://lkml.kernel.org/_b4_submit
> endpoint=https://lkml.kernel.org/_b4_submit, req={'action':
> 'auth-verify', 'msg': b'From: noralf@tronnes.org\nSubject:
> b4-send-verify\nX-Developer-Signature: v=1; a=ed25519-sha256;
> t=1669146435; l=45;\n i=noralf@tronnes.org; s=20221122;
> h=from:subject;\n bh=E4BgU7G2i7CeIkR8F1AfDTtOvDBQA7ld22s0U29/H84=;\n
> b=eRcDEBQvE702NSqEWQDLRyp9emSRvBjdhIW1c8e65OPf9Z1h78HB8UVqwWpf21mBSBtO8ZsLzPkg\n
> L5w0Y/ekCLtNWAVqAjRGRASBZKkcbWnQ/CWLAHmzbHskL1tiwgMv\nX-Developer-Key:
> i=noralf@tronnes.org; a=ed25519;\n
> pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=\n\nverify:7ad470b4-f531-4632-8093-738d4d3e5d88\n'}

Heh, woops, I got turned around with encode() and decode() again -- we do put
bytes there, but it works for me and it doesn't work for you despite the same
Python version. Wonderful.

I'm guessing it's probably something python-requests handles behind the
scenes. What version is python3-requests for you?

-K
