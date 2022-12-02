Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5809D4C71
	for <tools@linux.kernel.org>; Fri,  2 Dec 2022 15:56:48 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id d13so3670417qvj.8
        for <tools@linux.kernel.org>; Fri, 02 Dec 2022 07:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENskZGDoSnMEuVXUKpi11Gd2R9kB0JpkZRho3dRqFDc=;
        b=EbZdsmEli1Lxq0r9vjxI7hDMgTkGPrrMRKE3o720fpsbUdMUWWst0MVIEzt+5syEMv
         oGYOJFwujwrwQQIcQJYY9IpI503A21WUxcEwW8mNmynoHcpYElS0uKmOP8j9iPKWLPhK
         0DJezxc9D1Ob4sAfAtWsKH42U+RLfxrzn/nLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENskZGDoSnMEuVXUKpi11Gd2R9kB0JpkZRho3dRqFDc=;
        b=YfuCVfqoezLJFz6jol0gOiyBLRkl80aA8Ylop/iqZSdeUuLxHsA4WGjKksr5j5beD6
         s9KwYWquwY4w9Vsjho+0NxgQtxo3yhlmfWxaefu0ojUMy6GOKr++DPSXMNMf+db/BHFy
         GkpFFgy+TzxYdJXNeXRq+o4X4XP9NbJvYG1ifCJjZ35IwtQfG+57vQ1hoUOqjnCaOi9N
         3d2PdO3ZzCA0Af0IkLo+4iUKmIys+mUKoDUblc49YFnR5+EJSSyk+9n9AsXX05dAciWR
         98Rft0QVqBzDPc/gfLV65AQcU3z213rCFk1i+PdeGPq/cYaWh27BQb8AWLg0wL+O7FNs
         +pTg==
X-Gm-Message-State: ANoB5pngAMhMLAJVs6nnBmXv5eECbo19A3RLIVdzMBf9i65oPRtKJFrg
	clW1QVZdOeBS1kBPkUou2lv09gnXWuxaWGgL
X-Google-Smtp-Source: AA0mqf5OENfGFdnulsiXYqnn4BxXSSP07TC2hfzY82MEiVEd4fiADyfm7Fm4owbonbaK+kjF4qCsbg==
X-Received: by 2002:ad4:55e7:0:b0:4c7:355:918d with SMTP id bu7-20020ad455e7000000b004c70355918dmr21131533qvb.65.1669996606977;
        Fri, 02 Dec 2022 07:56:46 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8464c000000b003a55fe9f352sm4367835qto.64.2022.12.02.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:56:46 -0800 (PST)
Date: Fri, 2 Dec 2022 10:56:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: b4: change in individual patch Cc: logic
Message-ID: <20221202155644.kbnqvune7mo4khue@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Per feedback in [1], I implemented the following change in how "b4 prep" and
"b4 send" treat Cc: trailers in individual commits.

b4 prep change:

- `b4 prep --auto-to-cc` will no longer add Cc: trailers from individual
  commits into the cover letter

b4 send change:

- Cc: addresses in the cover letter will receive *all* patches in the series
- Cc: addresses in individual commits will receive the cover letter plus
  *only* those patches where they are explicitly listed in Cc:

This change is in the latest b4 master branch (0.11-dev).

-K

[1] https://lore.kernel.org/all/20221201141642.uvonbrny4rhuacl5@meerkat.local/
