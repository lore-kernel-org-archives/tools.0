Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5BA2770E
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 17:32:40 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-150debe2b7cso2311235fac.0
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 09:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDLS8KvJksMPHYhnsjrxIVy46uNRSaACuDoRzQw+EqM=;
        b=O2CXQ4Ta7c/Xe0v9mUiC1G6uk41I4wJylIQ+FNo6hHUWluWWsCY2x3CCzgraZnIpUv
         9G31w5Rc9tpti9z9HRe/hCwP0sVCuW7r2nmsOXWoYbqPmJnogv9DtlC/bf5pYTayruT6
         Er8WkfVQw1gfZsOnuXMdm9lgnBbUwAxPJ6FQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDLS8KvJksMPHYhnsjrxIVy46uNRSaACuDoRzQw+EqM=;
        b=z54MZChtx8wVsjrK0wKBcmMFEXKkHeQw6EofeOLKLNTwYxy3EinQ/daejb84gC+oCW
         GJmJ13U4Zhlvt69RcuDS2k4C0n0sujCwAsuJbm6eR0fjxLRCzqARm+vBV8gF5F0VISNT
         WWGU4T3EtQl5p3zY/UNfncWVqYv1AogQb/+aLXBhl6aCH9brhDsiDPGEMiPOlqFTh8MX
         rbyUThhCrrMVL6wTzLTK7ult3jwY9KB9KJhMVHnKmomaRjUbwe2QY6VFMPozutoxNkay
         ZnGp+zUYvgvg497iyUrACAIfdLhQlvHThQe40iiBxEG/g0N24hfj23CvrAxxd90f0k+v
         N71w==
X-Gm-Message-State: AFqh2krUlrBUTKxY7CmvbHSkozcCzOJjqmgy7WLQA6ktyVeIYBP7oU74
	IAIBDw21oHYndNPxES9HFoljwQ==
X-Google-Smtp-Source: AMrXdXsJZk88YNQyElgrh+J2UZe7+iUkhq3A9x/oUoE7gvlp84NiMaV+GiUrJ42+LgSlMiRtHwWsVQ==
X-Received: by 2002:a05:6870:c115:b0:144:a2dd:805b with SMTP id f21-20020a056870c11500b00144a2dd805bmr30232574oad.1.1673026359183;
        Fri, 06 Jan 2023 09:32:39 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id 7-20020a05620a040700b006fc8fc061f7sm805171qkp.129.2023.01.06.09.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:32:38 -0800 (PST)
Date: Fri, 6 Jan 2023 12:32:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <20230106173237.tpsdbdnzjfbgulcg@meerkat.local>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
 <20230106170038.tbdihuu667upvqnr@meerkat.local>
 <Y7hWOEoqPsF+Wrtx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ead3sl4ea265mv6j"
Content-Disposition: inline
In-Reply-To: <Y7hWOEoqPsF+Wrtx@sirena.org.uk>


--ead3sl4ea265mv6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 05:11:20PM +0000, Mark Brown wrote:
> > This will grab the entire thread that you can then reply to (plus see if
> > anyone's already replied to it). You can even fetch that into your exis=
ting
> > maildir:
> >=20
> >     b4 mbox -fo ~/Mail < am-ready.mbx
> >=20
> > I know this adds an extra step, but this is also more proper, I think.
>=20
> For this workflow a command that would easily let me fetch a specific
> message without pulling in the rest of the series would be ideal, b4
> mbox doesn't seem to even have an equivalent of b4 am's message ranges.

What if I give you:

    b4 mbox --refetch mbox

This will refetch all the messages in the mbox with their original headers?

-K

--ead3sl4ea265mv6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY7hbKAAKCRC2xBzjVmSZ
bIR+AP0WnAsu7XQhMXKiZVJfFKpkq+981k7zeRVhlHWn12dK2AEA0SFmex6YPUBI
3Qb6q/XyVxM0D791K0fH30KkpWumEwU=
=mefD
-----END PGP SIGNATURE-----

--ead3sl4ea265mv6j--
