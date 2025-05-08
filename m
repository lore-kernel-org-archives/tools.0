Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0557278E4A
	for <tools@linux.kernel.org>; Thu,  8 May 2025 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718159; cv=none; b=cHiy8nJpA16ogK23kjLPs05hTbyi+WlkCkdDH5zKz6B0I4FHvx5YXF7G5VOujgDr0nC80XRIV/oE2qTmUKItBJY/+eM6KzSs8h8IdO+4+QL838qlVDd6JVgRIcKmclRrYTto3DXDJmDAhCqpd3dZ6u2m2uE5Cg+b2zEoIUfzUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718159; c=relaxed/simple;
	bh=oiKS3PyiR4ru7EiBf1mss4u65RpdEjGcx+jmP0fa/g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSuEdgqtbL4eqHVqFLZHQuysSFFhs+bjIBOeaH8K7wBqwYq6BwqBfaUMSm4DZwKXBK7C8/6GCBPNt3w68qK3LmawD+bJRp2Y02m8vhSErC8i6aUnFdfbgTSVKD9t5lars25b4z8e0sTfevWP6J0h89AXsoDT9s0yLKgJts1wc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wSSQbpne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wSSQbpne"
Received: by smtp.kernel.org (Postfix)
	id 46BBBC4CEED; Thu,  8 May 2025 15:29:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F760C4CEE7
	for <tools@kernel.org>; Thu,  8 May 2025 15:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7F760C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0b933f214so449902f8f.0
        for <tools@kernel.org>; Thu, 08 May 2025 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746718155; x=1747322955; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iUAZSeOgxKTNSWX7w7S8whSCZFi1xPD8uLMCqAelVQ=;
        b=wSSQbpnevPcx6Tw4LPXrsroPKvLvA5UFzCM67ph9dFPjocjT0krN+k4zJnNeXxd4Pc
         JLVoKtXWKhHV/H3sHhLN5GzGqjUjEZpvZ8IMq7qLxSg0I+6koLb2ZDvW7gwKmWsxF70E
         eZUILb6qdtScLwXmhmhwQaq4OKRiRNN0XcWiGgj2kkDpZCmfCyBKhQ3RCG0W2cghiNoa
         3CsnLpQboHOZyJl1bqCx+jTC9uePatcilJYRXZxLXkF7jW8GWVJCDdYhfTuxkKp8C7qk
         UNG+PBUMHWI4w+z9PJuo0QnHkPrhGZoIG5NFvd58ZrFW/TIiwAmNTJSTXK9AkVez3oh5
         IglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718155; x=1747322955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iUAZSeOgxKTNSWX7w7S8whSCZFi1xPD8uLMCqAelVQ=;
        b=Gl3fQLOo0BdGjlD8orr9D4O+g6FENRs60PklqHMvbB9SNYombOxQQxiQ4Y4P9sXhXn
         E2Wcr9ZaVRFkaxXKSCfPz+Q6fYVIdbJaOlDvYC6TU9/YW/5nZZN+wLQf783HF4u7bsaV
         ut6637rYoEgCumfFxO6Qa75aNsyZkIPMZpPI8NNltAyC73waUJ+4tu/YG9DNp3NR2hfI
         Xh/V0JedREFGgxQHZcTgQOx8dcadnFuSsMdjWGYcigedhxROXAKyyBewkkv9DNdTf+nn
         j6aJiZSJg/nizMj84aGTu00Lv53PcNa2sxvq/+VUw8z/M1RolDF7ycBl9SXDHHdhmkyX
         2JIg==
X-Gm-Message-State: AOJu0YyRGxAFpX9Fl7BvoTT9Xqi4q9jN6CcobEIRv7ProwUQy5ci1yP/
	y7qN/PaoI2Wb643ngzNSDs/6VPXJzTdDnaVLdkuKdUv9XvClJKSLsRHkAhtecNo=
X-Gm-Gg: ASbGncv8IMOUkZu2o5yDA/y4JwKZ8Bl8EXS9y1FznO6bz369Q+TJ7ER8ZRt8emiqXC2
	3sCX+BRV8WMeMwOS63XkH1DCZAyPYY9Ea+DkRKKsBg5Rro3U9IGY6Odjn48zgr4Te7N2iMVKB3I
	Rj3N4l4miqDgf+8xZPeZJyU8RYGGBAbUlYyW2p1DYmYlqwi5vlXrPkElPzSwOxbNzx1N78XKIEI
	hbs5nwKN5Nzo5hH61NI1/xdddFcbMJ9bd5ZHBJpKB9LAUerl42q/rh1DfbYg0SPzK7zQleWJ+HD
	3GMWeCVwfFPlpeQATrIe4Ne5NK3j613YpG9S/K9yDA93gL0BGap8phiNTDPYaMVZM5w+IYg/AyM
	1BBEG5hc=
X-Google-Smtp-Source: AGHT+IGUvZezxQGlmnoYTdIi5yg/TH1CEWXpgf4vKmb3hMpTNOcL4SUyYw/FyUYUoId9/ZFtDwYuKQ==
X-Received: by 2002:a05:6000:2088:b0:39e:e3ef:5cbf with SMTP id ffacd0b85a97d-3a0b49ad00amr6745200f8f.24.1746718154472;
        Thu, 08 May 2025 08:29:14 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f0easm40317555e9.12.2025.05.08.08.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:29:13 -0700 (PDT)
Date: Thu, 8 May 2025 17:29:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate 1/3] Put a representation of the trust path in a
 txt file
Message-ID: <5hkczvc3idfnjjijgel6ntj342akxefa534dt3nfj2l2zb3pp6@xlq2cjzsp3rg>
References: <20250508094451.762484-5-u.kleine-koenig@baylibre.com>
 <20250508094451.762484-6-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7jrpwuhih74bhzb"
Content-Disposition: inline
In-Reply-To: <20250508094451.762484-6-u.kleine-koenig@baylibre.com>


--g7jrpwuhih74bhzb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wotmate 1/3] Put a representation of the trust path in a
 txt file
MIME-Version: 1.0

On Thu, May 08, 2025 at 11:44:53AM +0200, Uwe Kleine-K=F6nig wrote:
> Up to now changes to the trust paths are hardly reviewable when looking
> at the git history because they only have an effect on the generated
> .svg. However these also change when the installed graphviz changes and
> the diffs are hardly understandable.
>=20
> For that reason put a text representation of the graph into the key
> files.
>=20
> A nice side effect of this change is that for a trust path
>=20
> 	Linus -> A -> B -> C
>=20
> the graph for C is regenerated if B's trust path was shortend to
>=20
> 	Linus -> B
>=20
> Co-developed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
>  export-keyring.py | 155 +++++++++++++++++++++++++++++-----------------
>  make-sqlitedb.py  |   5 ++
>  2 files changed, 102 insertions(+), 58 deletions(-)
>=20
> diff --git a/export-keyring.py b/export-keyring.py
> index 6cf95f99738d..5531b096a6aa 100755
> --- a/export-keyring.py
> +++ b/export-keyring.py
> @@ -104,75 +104,114 @@ if __name__ =3D=3D '__main__':
>          args =3D ['-a', '--export', '--export-options', cmdargs.key_expo=
rt_options, kid]
>          keydata =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
>          keyout =3D os.path.join(keydir, '%s.asc' % kid)
> -        # Do we already have a file in place?
> -        if os.path.exists(keyout):
> -            # Load it up and see if it's different
> -            with open(keyout, 'rb') as fin:
> -                old_keyexport =3D fin.read()
> -                if old_keyexport.find(keydata) > 0:
> -                    logger.debug('No changes for %s', kid)
> -                    continue
> -
> -        # Now, export the header
> -        args =3D ['--list-options', 'show-notations', '--list-options',
> -                'no-show-uid-validity', '--with-subkey-fingerprints', '-=
-list-key', kid]
> -        header =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
> -        keyexport =3D header + b'\n\n' + keydata + b'\n'
> -
> -        if not wotmate.lint(keydata):
> -            logger.debug('Skipping %s due to bad linter results', kid)
> -            continue
> =20
>          key_paths =3D wotmate.get_key_paths(c, from_rowid, to_rowid, cmd=
args.maxdepth, cmdargs.maxpaths)
>          if not len(key_paths):
>              logger.debug('Skipping %s due to invalid WoT', kid)
>              continue
> =20
> -        with open(keyout, 'wb') as fout:
> -            fout.write(keyexport)
> -            logger.info('Wrote %s', keyout)
> +        kpblock =3D ''
> +        for kp in key_paths:
> +            for lvl, rowid in enumerate(kp):
> +                kpuid =3D wotmate.get_uiddata_by_pubrow(c, rowid)
> +                kpblock +=3D f'   {lvl}  {kpuid}' if lvl > 0 else f'from=
  {kpuid}'
> +                kpblock +=3D '\n'
> +            kpblock +=3D '\n'
> +        key_paths_repr =3D kpblock.encode()
> =20
> -        if cmdargs.gen_b4_keyring:
> -            # Grab all uid lines from the header
> -            for line in header.split(b'\n'):
> -                if not line.startswith(b'uid'):
> -                    continue
> -                line =3D line[3:].decode('utf-8', 'ignore').strip()
> -                if line:
> -                    parts =3D parseaddr(line)
> -                    if not len(parts[1]) or parts[1].count('@') !=3D 1:
> +        # Is there already a key file in place?
> +        key_changed =3D False
> +        if os.path.exists(keyout):
> +            # Load it up and see if it's different
> +            with open(keyout, 'rb') as fin:
> +                old_keyexport =3D fin.read()
> +                if keydata not in old_keyexport:
> +                    key_changed =3D True
> +                    logger.debug('Key changes detected for %s', kid)
> +        else:
> +            key_changed =3D True
> +
> +        txtgraphout =3D os.path.join(graphdir, "%s.txt" % kid)
> +        trust_changed =3D key_changed
> +        if not os.path.exists(txtgraphout):
> +            logger.debug('Forcing generation of the text graph for %s', =
kid)
> +            trust_changed =3D True
> +        elif not key_changed:
> +            # Load it up and see if trust relationships changed
> +            with open(txtgraphout, 'rb') as fin:
> +                old_key_paths_repr =3D fin.read()
> +                if key_paths_repr not in old_key_paths_repr:
> +                    trust_changed =3D True
> +                    logger.debug('Trust changes detected for %s', kid)
> +
> +        if not (key_changed or trust_changed):
> +            logger.debug('No changes detected for %s', kid)
> +            continue
> +
> +        if key_changed:
> +            # Now, export the header
> +            args =3D ['--list-options', 'show-notations', '--list-option=
s',
> +                    'no-show-uid-validity', '--with-subkey-fingerprints'=
, '--list-key', kid]
> +            header =3D wotmate.gpg_run_command(args, with_colons=3DFalse)
> +            keyexport =3D header + b"\n\n" + keydata + b"\n"
> +
> +            if not wotmate.lint(keydata):
> +                logger.debug('Skipping %s due to bad linter results', ki=
d)
> +                continue
> +
> +            with open(keyout, 'wb') as fout:
> +                fout.write(keyexport)
> +                logger.info('Wrote %s', keyout)
> +
> +            if cmdargs.gen_b4_keyring:
> +                # Grab all uid lines from the header
> +                for line in header.split(b'\n'):
> +                    if not line.startswith(b'uid'):
>                          continue
> -                    local, domain =3D parts[1].split('@', 1)
> -                    kpath =3D os.path.join(cmdargs.outdir, '.keyring', '=
openpgp', quote_plus(domain), quote_plus(local))
> -                    pathlib.Path(kpath).mkdir(parents=3DTrue, exist_ok=
=3DTrue)
> -                    spath =3D os.path.join(kpath, 'default')
> -                    tpath =3D os.path.relpath(keyout, kpath)
> -                    if os.path.islink(spath):
> -                        if os.readlink(spath) =3D=3D tpath:
> +                    line =3D line[3:].decode('utf-8', 'ignore').strip()
> +                    if line:
> +                        parts =3D parseaddr(line)
> +                        if not len(parts[1]) or parts[1].count('@') !=3D=
 1:
>                              continue
> -                        if spath in my_symlinks:
> -                            # There's multiple keys with the same identi=
ty. First one wins, for the lack of a
> -                            # better solution that is also sane.
> -                            logger.info('Notice: multiple keys with the =
same UID %s', parts[1])
> -                            continue
> -                        os.unlink(spath)
> -                        logger.info('Notice: fixing symlink for %s', par=
ts[1])
> -                    os.symlink(tpath, spath)
> -                    my_symlinks.add(spath)
> -                    logger.info('Symlinked %s to %s', kid, spath)
> +                        local, domain =3D parts[1].split('@', 1)
> +                        kpath =3D os.path.join(cmdargs.outdir, '.keyring=
', 'openpgp', quote_plus(domain),
> +                                             quote_plus(local))
> +                        pathlib.Path(kpath).mkdir(parents=3DTrue, exist_=
ok=3DTrue)
> +                        spath =3D os.path.join(kpath, 'default')
> +                        tpath =3D os.path.relpath(keyout, kpath)
> +                        if os.path.islink(spath):
> +                            if os.readlink(spath) =3D=3D tpath:
> +                                continue
> +                            if spath in my_symlinks:
> +                                # There's multiple keys with the same id=
entity. First one wins, for the lack of a
> +                                # better solution that is also sane.
> +                                logger.info('Notice: multiple keys with =
the same UID %s', parts[1])
> +                                continue
> +                            os.unlink(spath)
> +                            logger.info('Notice: fixing symlink for %s',=
 parts[1])
> +                        os.symlink(tpath, spath)
> +                        my_symlinks.add(spath)
> +                        logger.info('Symlinked %s to %s', kid, spath)
> =20
> -        graph =3D pd.Dot(
> -            graph_type=3D'digraph',
> -        )
> -        graph.set_node_defaults(
> -            fontname=3Dcmdargs.font,
> -            fontsize=3Dcmdargs.fontsize,
> -        )
> +        if trust_changed:
> +            graph =3D pd.Dot(
> +                graph_type=3D'digraph',
> +            )
> +            graph.set_node_defaults(
> +                fontname=3Dcmdargs.font,
> +                fontsize=3Dcmdargs.fontsize,
> +            )
> +
> +            wotmate.draw_key_paths(c, key_paths, graph, cmdargs.show_tru=
st)
> +            graphout =3D os.path.join(graphdir, '%s.%s' % (kid, cmdargs.=
graph_out_format))
> +            graph.write(graphout, format=3Dcmdargs.graph_out_format)
> +            logger.info('Wrote %s', graphout)
> +
> +            logger.debug('Writing out the text graph')
> +            with open(txtgraphout, 'wb') as fout:
> +                fout.write(key_paths_repr)
> +                logger.info('Wrote %s', txtgraphout)
> =20
> -        wotmate.draw_key_paths(c, key_paths, graph, cmdargs.show_trust)
> -        graphout =3D os.path.join(graphdir, '%s.%s' % (kid, cmdargs.grap=
h_out_format))
> -        graph.write(graphout, format=3Dcmdargs.graph_out_format)
> -        logger.info('Wrote %s', graphout)
>          wcount +=3D 1
> =20
>      logger.info('Processed %s keys, made %s changes', kcount, wcount)
> diff --git a/make-sqlitedb.py b/make-sqlitedb.py
> index fec199def51d..e8c5969f4d50 100755
> --- a/make-sqlitedb.py
> +++ b/make-sqlitedb.py
> @@ -163,6 +163,11 @@ def keyring_load_sig_data(c, pub_keyid_rowid_map, ui=
d_hash_rowid_map):
>                  ignored_sigs +=3D 1
>                  continue
> =20
> +            # skip SHA-1 based signatures
> +            if fields[15] =3D=3D "2":
> +                ignored_sigs +=3D 1
> +                continue
> +
>              # do we have the key that signed it?
>              if sigkeyid in pub_keyid_rowid_map.keys():
>                  uidsigs[sigkeyid] =3D (

If you apply this patch, please drop this hunk. This was not supposed to
be part of this patch. While I think doing this change is right, it
should be done in a separate commit and well considered.

Best regards
Uwe

--g7jrpwuhih74bhzb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgczb4ACgkQj4D7WH0S
/k4TPgf/V1EI+xCSl3ikdbVxbHKEtSEQB7Zs9yx8872B4qwY3Z4dxRkBaRfGvuMA
JSe8m2r4/QfotXf5o4TtUvW1NbD8NLKMBd2U+UffwOn7PdVdJlSgKZM4PsSBPu2p
zgR++zQlke+Q2m74x+OUYdv31L57NF6wmeYE0ycJkriRbZk4dnb2xhWiwy6H7Sbj
6EXbKYpRUYOnkZcDBF+/2g4/zeY8IHI7ErI0peukEqrEpl7LvHuUI1pA8HrrlHKz
7XkMLm2AkReLdSclDJGn7ckJLeGxqCdWh5F0Mt7FoBDcSUspdGja4H81W5gaITL7
erKWLeSX4OZw5sos3V0UmwOdJqTXIg==
=z6bG
-----END PGP SIGNATURE-----

--g7jrpwuhih74bhzb--
