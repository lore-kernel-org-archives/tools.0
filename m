Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891DA386C1B
	for <tools@linux.kernel.org>; Mon,  1 Jun 2026 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302464; cv=none; b=XcphURvgXxV24Pj5GPPLBpdl5Th8Gz19+vwK8AYNyy7jrhMcOD0U8NUrGoKSCSIRW7zt1AhCreAZZtbuhjKy8G39Zf3T2bQ2lOC3IEWyp7gRDJ846J0HFUxQK/k1TzdhcMZgigODgxiijMAE4BfO1SxnU65Of67/TdLSYQD8KQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302464; c=relaxed/simple;
	bh=DQWOvDV3r5aTyVufBu369E0XwAKET9OrDYm0JbKMgys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3qqNdSHMbSeSvLkxu9H7CTYCi1ZoaWho93rDOs9uTCiv2dW2njQYXSW/fuHvFtkYqgisC3ZaZpvLS9gUhpOr9f+IoihyTQt0Bx4QSmHxuoCNQay7SScsXxr4j59Lvpm2bs96wcNNS0yR0/Xshzs4xdCYynzv/vOL4gEsUsDn88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso896218e0c.2
        for <tools@linux.kernel.org>; Mon, 01 Jun 2026 01:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302462; x=1780907262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBVqrpkzCm+Tf1FFUXfAmEkqU6ZtJx3YbVdoRHIIa9Q=;
        b=iOUtzHe2J0b37W45UuAeCwDFWbvilGZoHuL+53ONe3eUFl/XUH5+csTRvEW9/dib9W
         vlV5wenus/p2D+iWbryE28+3XdBzw8vqkl5Vv2vGw61Azo1or/dNfyzHofBzlp7R8L7E
         hnQyGwzOUogxXaVIc4YfZqtNgkyb9DIpWWoSws6Th8++TVI1pgMK+QbPtRMyAdGRjr4A
         oerq4xxzQqd2uXrTmBv53xKjQFH5s7JoDYWFZVNIFelY2EWtRmp5lvMyY+8LeoTQh1u2
         Jy9sjRNdMejzN+Vl1DkFa7dgKF4UXPlLI1J6yGrdR9bF9fj0Yv5hGapNrF08OMoXN+SQ
         Vc9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9mQ1+uP9X6tQ3MhWP9734eNL8AnHHp03saslsESTsQcNjDOb4UccYj4GbFIHoOU2Q2LcJASw==@linux.kernel.org
X-Gm-Message-State: AOJu0Ywo92/9l0LlzBk2x/PFKllaG5ae1aT3Uv3WobU1qJEDqMEQBxfZ
	IVbfYygks4Q3u5+h3I+V6AVb2eecUPtjQ6otcKjLddJKm6aPDj90Eqv/7SpVew8k
X-Gm-Gg: Acq92OEN10ZJMRbXrXo5ePFFhXfW+VVo3Lr5/TkvRhIYCz1bfaZ45nInXOnefcc/GAs
	mmSLbd3XNp+7TpF4ISS2Ndp5fURqu2o7TOATWKV4jMXDeHJAI8xiwdo5JSpL4D1YfRSQ9X64+fk
	1M1wagQIsPWZXD2UzNhGXHUWOb5Hq53aMH2WWPqbpFhwNVFp5W+CV0P7CYJeBgLguyzlRKFh8XA
	SuiDwJZuN5/4wNMPc/Gmb8MFtpcYC+3wJ5xAwk8mQ+wAZrH+lup3mcg723kZh10RkfdRFTk11Bd
	LgYZCKh3Wk0kaBJeaW2ymFyC0gqW8Os5R/0s5IluwKPiuCCvEkzCCmqrS+FSIyUT+WGgLBP8Rz8
	SlENFBfq8ky9ZMgNcwVyVM046YzqPwWT5b9DYnnGcIU5v6asCUXwQm7O/F467r+ddldQ3iSZJ0U
	N2qNE321pC7LJdkcluHTbLybgjDt00Mj1blbuqARKpGJ1+pk2ZdjsHhRscX6yRBzjpliD2k8l4P
	+g=
X-Received: by 2002:a05:6122:514:b0:57f:a2f8:d2a with SMTP id 71dfb90a1353d-59bf57c28c6mr4246529e0c.11.1780302462426;
        Mon, 01 Jun 2026 01:27:42 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-59b02af204esm5920676e0c.5.2026.06.01.01.27.41
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 01:27:41 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso896210e0c.2
        for <tools@linux.kernel.org>; Mon, 01 Jun 2026 01:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PcD/QpxikDg6OPyIqtz7lW4b1N/5zi2Tg8UG4fpBwL5PSZ/V7757fyT0fPYrryE/IJQCduQ==@linux.kernel.org
X-Received: by 2002:a05:6123:108:b0:56d:8ded:796c with SMTP id
 71dfb90a1353d-59bf21173a3mr4240604e0c.4.1780302461698; Mon, 01 Jun 2026
 01:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
In-Reply-To: <CAJLQH1vPmWd0gL2MqfsTPF74_cSKqb7H8LL8nwjK2gYv6mB55Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Jun 2026 10:27:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmDj8iiYnMryWifEDqiP1XXQvxJq9U6EaJEP+j9RTeww@mail.gmail.com>
X-Gm-Features: AVHnY4LdVVIjtgHtauMGTC371n218yiPgRGaFRRrq4WWmB96jBMEqkSYjUBNdD8
Message-ID: <CAMuHMdXmDj8iiYnMryWifEDqiP1XXQvxJq9U6EaJEP+j9RTeww@mail.gmail.com>
Subject: Re: Proposal: preflight checklist/lint for AI-assisted Linux kernel
 bug reports
To: mo to <pitar21@gmail.com>
Cc: workflows@vger.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 May 2026 at 15:09, mo to <pitar21@gmail.com> wrote:
> I understand that AI-assisted vulnerability and bug reports have
> recently become a burden for kernel maintainers, especially when
> reports are duplicated, unverified, or lack enough technical detail to
> be actionable.
>
> I would like to suggest a lightweight =E2=80=9Cpreflight=E2=80=9D process=
 for
> AI-assisted bug reports.
>
> The goal is not to replace the existing Linux kernel email workflow,
> nor to move kernel development into a web-based ticket system.
> Instead, the idea is to add a simple validation layer before a report
> reaches maintainers.
>
> For AI-assisted reports, the submitter could be required to include a
> structured checklist such as:
>
> AI-assisted bug report checklist:

Which of the below are not suitable for a non-AI-assisted bug report?

> - Kernel version:
> - Commit hash:
> - Architecture:
> - Kernel config:

Do you always need the full .config?

> - Affected subsystem / file / function:
> - Reproducer:
> - Reproduction rate:
> - Full dmesg / KASAN / UBSAN / lockdep / syzkaller log:

Ouch.

Fortunately I didn't do that when reporting 'thousands of "sync_state()
pending due to" and hundreds of "deferred probe pending" messages'...

> - Checked latest mainline: yes/no
> - Checked stable trees: yes/no
> - Checked lore.kernel.org for duplicates: yes/no

Definitely! Also for mere humans.
(Hi nvram mutex fixes ;-)

> - Existing patch found: yes/no
> - Why this is considered a security issue:
> - Impact assessment:
> - Suggested fix or mitigation:
> - Human verification performed: yes/no

Perhaps only yes should be permitted?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
