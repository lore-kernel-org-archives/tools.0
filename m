Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8E7E7
	for <tools@linux.kernel.org>; Fri,  9 Dec 2022 12:35:23 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id vv4so11197766ejc.2
        for <tools@linux.kernel.org>; Fri, 09 Dec 2022 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hdBtR7bEur/Uwm5aTifxUFq/b8cnhLuYpHhneZcf0/Q=;
        b=kzhgeE7ps5ZDrkBhH4rpDc4NmRW7K/358mHq5WfkHT52KPKog87gFIYik0QQ0shzjK
         +iFWTPzxt84DmdoV35dR9w7vPZOuh8FAhnk0i81fmfpB8k5uwl3pQkth9gyvYm8+N4ID
         DFeB6+MURyJy2yFuDMKkR8IP8jxswmOAWkeOYQcQaZb36Ziy8MxFjCpOeTssgh6WnVGS
         tCPCfRbIzISRwDH7Eek3KaiJs85TydAoEOz/f96U5HBMRVVRYL2iPhPbDMM84DWjgTus
         SmKgyT1/tlnv2EKVFoLi2Khl3D9STjgC21QN6yMO4C6dhs8/BbiRIZEWWjennaTlP4qv
         ioKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdBtR7bEur/Uwm5aTifxUFq/b8cnhLuYpHhneZcf0/Q=;
        b=LSeRzxfo32aVOPQH2fk9/Z5trabPzmWDE6WfppGqGC10tUmgkYog9a7TVCZa6LhKjp
         AwJBpEP7QjcSt/INehUGbVyJilTmSN13spxLQlcyT7xBOthBnb08f0O6gWZt5gSpXf6n
         ysXwxo4IrfeTkKnfyW1NSF2WLA87YGn/Kn9M1DgYMLGqKmBL6vz4BW/LCLcPDT7A6o31
         SW4JHd1C+uclniCB2p0+2yuAR8a5uGUOqEs07mM+yQLHDbHaMYQ9WPbb9w5ZrS55pbSj
         vigE44Yxjwm0/dCA/7b9KLDcqkwTUzOF1do06f96Eu61J4reXEPAxhvf2JVTKYGkTQZP
         u5zg==
X-Gm-Message-State: ANoB5plsmUTcNrFAdUpmO3iy9IUR6PzGUhmz7mbaYDn4RdOoykRT3j1T
	11+MoSYh690Im2h0A62Uq4m3wKyAtbOru1bM
X-Google-Smtp-Source: AA0mqf6cDvGmQTO/tI/LVhw9JwT2tbyChIb74TF4mMEm2CLnvnSNxeHNKHp3WHNCfeWew3N9mUh9SA==
X-Received: by 2002:a17:906:81d3:b0:7c1:515:a0ec with SMTP id e19-20020a17090681d300b007c10515a0ecmr680998ejx.63.1670589321723;
        Fri, 09 Dec 2022 04:35:21 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ha10-20020a170906a88a00b00781be3e7badsm523793ejb.53.2022.12.09.04.35.21
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 04:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Dec 2022 13:35:21 +0100
Message-Id: <COXAHN6YWLQH.33YW8LAHHXH21@otso>
Subject: Requirement of using smtpPass
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <tools@linux.kernel.org>
X-Mailer: aerc 0.13.0

Hi,

I'm enjoying using b4 so far.
I've noticed that in both my current git-send-email setups (work &
personal address) I don't set smtpPass in my git config.

For example for gmail this is the config:

[sendemail]
	smtpserver =3D smtp.gmail.com
	smtpuser =3D luca.weiss@fairphone.com
	smtpencryption =3D tls
	smtpserverport =3D 587
	confirm =3D always

Regular git-send-email just prompts for the password when needed, or
alternatively I supply it in the invocation with
--smtp-pass=3D$(get-my-email-password) to avoid putting my email password
plaintext into the config.

However b4 just skips authenticating completely leading to more or less
obscure error messages from the smtp server (b4 only tries to
authenticate if it has both user *and* password set).

Would be great if I could specify in my config a command that will be
run that just prints the password on stdout (e.g. keepassxc-cli with
some parameters) and b4 uses this password then, this is then similar
functionality to the --smtp-pass=3D$(foo) I wrote above.

Regards
Luca
