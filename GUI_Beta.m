classdef dsptrial < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        DiscreteTimeSignalsAnalyzerPanel  matlab.ui.container.Panel
        TabGroup                        matlab.ui.container.TabGroup
        IntroTab                        matlab.ui.container.Tab
        WELCOMELabel                    matlab.ui.control.Label
        INTROTextAreaLabel              matlab.ui.control.Label
        INTROTextArea                   matlab.ui.control.TextArea
        LOGTextAreaLabel                matlab.ui.control.Label
        LOGTextArea                     matlab.ui.control.TextArea
        Label                           matlab.ui.control.Label
        InputTab                        matlab.ui.container.Tab
        EntertheSignalLabel             matlab.ui.control.Label
        UIAxes                          matlab.ui.control.UIAxes
        EnterthetimeseriesLabel         matlab.ui.control.Label
        input1                          matlab.ui.control.EditField
        EntertheAmplitudevaluesLabel    matlab.ui.control.Label
        input2                          matlab.ui.control.EditField
        plotting                        matlab.ui.control.Button
        PropTab                         matlab.ui.container.Tab
        SelectthepropertyButtonGroup    matlab.ui.container.ButtonGroup
        TimeshiftingButton              matlab.ui.control.Button
        FreqshiftingButton              matlab.ui.control.Button
        FoldingButton                   matlab.ui.control.Button
        SymmetryButton                  matlab.ui.control.Button
        InputSignalLabel                matlab.ui.control.Label
        XEditFieldLabel                 matlab.ui.control.Label
        Xinput                          matlab.ui.control.EditField
        Label_2                         matlab.ui.control.Label
        EnterShiftEditFieldLabel        matlab.ui.control.Label
        EnterShift                      matlab.ui.control.EditField
        ShiftButton                     matlab.ui.control.Button
        AnswerLabel                     matlab.ui.control.Label
        outLHS                          matlab.ui.control.TextArea
        ShiftButton2                    matlab.ui.control.Button
        EntercommaseparatedInputLabel   matlab.ui.control.Label
        ShiftButton3                    matlab.ui.control.Button
        ShiftButton4                    matlab.ui.control.Button
        MorePropTab                     matlab.ui.container.Tab
        TabGroup2                       matlab.ui.container.TabGroup
        MultiplicationinTimeTab         matlab.ui.container.Tab
        MultiplicationinTimeisgivenbytheequationLabel  matlab.ui.control.Label
        TextArea3                       matlab.ui.control.TextArea
        ComputeButton                   matlab.ui.control.Button
        EntercommaseparatedvaluesLabel  matlab.ui.control.Label
        LHSTextAreaLabel                matlab.ui.control.Label
        LHSTextArea                     matlab.ui.control.TextArea
        RHSTextAreaLabel                matlab.ui.control.Label
        RHSTextArea                     matlab.ui.control.TextArea
        Label_3                         matlab.ui.control.Label
        Input1EditFieldLabel            matlab.ui.control.Label
        Input1EditField                 matlab.ui.control.EditField
        Input2EditFieldLabel            matlab.ui.control.Label
        Input2EditField                 matlab.ui.control.EditField
        ConvolutionTab                  matlab.ui.container.Tab
        ConvolutionusingStockhamsMethodLabel  matlab.ui.control.Label
        FormulaTextAreaLabel            matlab.ui.control.Label
        FormulaTextArea                 matlab.ui.control.TextArea
        EntercommaseparatedvaluesLabel_2  matlab.ui.control.Label
        CalculateButton                 matlab.ui.control.Button
        AnswerTextAreaLabel             matlab.ui.control.Label
        AnswerTextArea                  matlab.ui.control.TextArea
        Input1EditField_2Label          matlab.ui.control.Label
        Input1EditField_2               matlab.ui.control.EditField
        Input2Label                     matlab.ui.control.Label
        Input2EditField_2               matlab.ui.control.EditField
        ParsevalsIdentityTab            matlab.ui.container.Tab
        ParsevalsIdentityLabel          matlab.ui.control.Label
        FormulaTextArea_2Label          matlab.ui.control.Label
        FormulaTextArea_2               matlab.ui.control.TextArea
        Input1TextAreaLabel             matlab.ui.control.Label
        Input1TextArea                  matlab.ui.control.TextArea
        Input2TextAreaLabel             matlab.ui.control.Label
        Input2TextArea                  matlab.ui.control.TextArea
        EntercommaseparatedvaluesLabel_3  matlab.ui.control.Label
        VerifyButton                    matlab.ui.control.Button
        LHSTextArea_2Label              matlab.ui.control.Label
        LHSTextArea_2                   matlab.ui.control.TextArea
        RHSTextArea_2Label              matlab.ui.control.Label
        RHSTextArea_2                   matlab.ui.control.TextArea
        SupportTab                      matlab.ui.container.Tab
        LICENSETextArea                 matlab.ui.control.TextArea
        CODETextAreaLabel               matlab.ui.control.Label
        CODETextArea                    matlab.ui.control.TextArea
    end

    
    methods (Access = private)
        
        
    end
    

    methods (Access = private)

        % Value changed function: input1
        function input1ValueChanged(app, event)
            value1 = app.input1.Value;
            global value1;
            
        end

        % Value changed function: input2
        function input2ValueChanged(app, event)
            value2 = app.input2.Value;
            global value2;
            
        end

        % Button pushed function: plotting
        function plottingButtonPushed(app, event)
            value1 = app.input1.Value;
            value1 = str2double(strsplit(value1,','));
            value2 = app.input2.Value;
            value2 = str2double(strsplit(value2,','));
            
            stem(app.UIAxes,value1,value2);
            
            
            
            
        end

        % Button pushed function: TimeshiftingButton
        function TimeshiftingButtonPushed(app, event)
            app.Xinput.Editable = 'on';
            app.Label_2.Text = sprintf('%s \n %s' , 'Formula : ', 'LHS: DFT{x((n-no))} = RHS: (Wn^kno)*X(k)');
            a = app.EnterShift.Value;
            global a;
            app.ShiftButton.Visible = 'on';
            app.ShiftButton.Enable = 'on';
            app.ShiftButton2.Visible = 'off';
            app.ShiftButton2.Enable = 'off';
            app.ShiftButton3.Visible = 'off';
            app.ShiftButton3.Enable = 'off';
            app.ShiftButton4.Visible = 'off';
            app.ShiftButton4.Enable = 'off';
            app.Xinput.Value = ' ';
            app.EnterShift.Value = ' ';
            app.outLHS.Value = ' ';
            
        end

        % Button pushed function: ShiftButton
        function ShiftButtonPushed(app, event)
            
            x = app.Xinput.Value;
            x = str2double(strsplit(x,','));
            x1 = int8(x);
            %LHS compute
            a = app.EnterShift.Value;
            a = str2double(a); a = int8(a);
            x2 = circshift(x1,a); x3 = fft(x2);
            
            x3 = num2str(x3);
            app.outLHS.Value = x3;
            %RHS compute
            
            %for n=1:length(x4)-1
            %  x4(n) = x4(n)*(exp((-i)*2*pi*a*(n-1)))/length(x4);
            %end
            %x4 = num2str(x4);
            %app.outRHS.Value = x3;
            
        end

        % Button pushed function: FreqshiftingButton
        function FreqshiftingButtonPushed(app, event)
            app.Xinput.Editable = 'on';
            app.Label_2.Text = sprintf('%s \n%s' , 'Formula : ','LHS: DFT{Wn^ln*x(n)} = RHS: X((k-l))n');
            app.ShiftButton.Visible = 'off';
            app.ShiftButton.Enable = 'off';
            app.ShiftButton2.Visible = 'on';
            app.ShiftButton2.Enable = 'on';
            app.ShiftButton3.Visible = 'off';
            app.ShiftButton3.Enable = 'off';
            app.ShiftButton4.Visible = 'off';
            app.ShiftButton4.Enable = 'off';
            app.Xinput.Value = ' ';
            app.EnterShift.Value = ' ';
            app.outLHS.Value = ' ';
            
        end

        % Button pushed function: ShiftButton2
        function ShiftButton2Pushed(app, event)
            
            x = app.Xinput.Value;
            x = str2double(strsplit(x,','));
            x1 = int8(x);
            
            a = app.EnterShift.Value;
            a = str2double(a); a = int8(a);
            Xk = fft(x1);
            X = circshift(Xk,a);
            
            X = num2str(X);
            app.outLHS.Value = X;
        end

        % Button pushed function: ShiftButton3
        function ShiftButton3Pushed(app, event)
            x = app.Xinput.Value;
            x = str2double(strsplit(x,','));
            x1 = int8(x);
            
            
            X2 = fft(x2);
            X3 = conj(fft(x1));
            app.outLHS.Value = sprintf('%s \n%s','LHS:', 'X2', 'RHS', 'X3');
        end

        % Button pushed function: FoldingButton
        function FoldingButtonPushed(app, event)
            app.Xinput.Editable = 'on';
            app.Label_2.Text = sprintf('%s \n%s' , 'Formula : ','LHS: DFT{x((-n))N} = RHS: X((-k))N');
            app.ShiftButton.Visible = 'off';
            app.ShiftButton.Enable = 'off';
            app.ShiftButton2.Visible = 'off';
            app.ShiftButton2.Enable = 'off';
            app.ShiftButton3.Visible = 'on';
            app.ShiftButton3.Enable = 'on';
            app.ShiftButton4.Visible = 'off';
            app.ShiftButton4.Enable = 'off';
            app.ShiftButton3.Text = 'Fold';
            app.EnterShift.Visible = 'off';
            app.EnterShift.Enable = 'off';
            app.EnterShift.Value = ' ';
            app.AnswerLabel.Visible = 'on';
            app.ShiftButton3.Position = [352 164 100 22];
            app.Xinput.Value = ' ';
            app.EnterShift.Value = ' ';
            app.outLHS.Value = ' ';
        end

        % Button pushed function: SymmetryButton
        function SymmetryButtonPushed(app, event)
            app.Xinput.Editable = 'on';
            app.Label_2.Text = sprintf('%s \n%s' , 'Formula : ','LHS: DFT{x((-n))N} = RHS: X((-k))N');
            app.ShiftButton.Visible = 'off';
            app.ShiftButton.Enable = 'off';
            app.ShiftButton2.Visible = 'off';
            app.ShiftButton2.Enable = 'off';
            app.ShiftButton3.Visible = 'off';
            app.ShiftButton3.Enable = 'off';
            app.ShiftButton4.Text = 'Check';
            app.EnterShift.Visible = 'off';
            app.ShiftButton4.Visible = 'on';
            app.ShiftButton4.Enable = 'on';
            app.EnterShift.Value = ' ';
            app.EnterShift.Enable = 'off';
            app.AnswerLabel.Enable = 'on';
            app.ShiftButton4.Position = [352 164 100 22];
            app.Xinput.Value = ' ';
            app.EnterShift.Value = ' ';
            app.outLHS.Value = ' ';
        end

        % Button pushed function: ShiftButton4
        function ShiftButton4Pushed(app, event)
            x = app.Xinput.Value;
            x = str2double(strsplit(x,','));
            x1 = int8(x);
            
            N = length(x1);
            X = fft(x1);
            Xstar = conj(X);
            app.outLHS.Value = sprintf('%s \n%s' , Xstar,'\n', X ,'WE see that X(N-k) = Xstar');
            
            
        end

        % Button pushed function: ComputeButton
        function ComputeButtonPushed(app, event)
            d = app.Input1EditField.Value;
            d = str2num(d);
            
            e= app.Input2EditField.Value;
            e = str2num(e);
            
            
            if length(d) > length(e)
                N = length(d);
            else
                N = length(e);
            end
            X1k = fft(d); X2k = fft(e);
            LHS = d.*e;
            LHS = fft(LHS);
            L = num2str(LHS);
            app.LHSTextArea.Value = L;
            RHS = (cconv(X1k,X2k,N)/N);
            R = num2str(RHS);
            app.RHSTextArea.Value = R;
            
            if(LHS == RHS)
                app.Label_3.Text = 'Verified';
            else
                app.Label_3.Text = 'Not Verified';
            end
            
            
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            d = app.Input1EditField_2.Value;
            d = str2num(d);
            
            e= app.Input2EditField_2.Value;
            e = str2num(e);
            
            
            Xd = fft(d); Xe = fft(e);
            
            RHS = Xd.*Xe; RHS = ifft(RHS);
            
            
            R = num2str(RHS);
            app.AnswerTextArea.Value = R;
            
            
        end

        % Button pushed function: VerifyButton
        function VerifyButtonPushed(app, event)
            d = app.Input1TextArea.Value;
            d = str2double(d);
            d = int8(d);
            e= app.Input2TextArea.Value;
            e = str2double(e);
            e = int8(e);
            
            N = length(d);
            
            
            x1_star = conj(d);
            
            for u=1:N
                LHS(u) = sum(x1_star(u).*e(u));
                
            end
            LHS = sum(LHS);
            
            
            X1 = fft(d);
            X2 = fft(e);
            X1_star = conj(X1);
            
            for v = 1:N
                R(v) = sum(mtimes(X1_star(v),X2(v)));
            end
            
            RHS = R/N;
            RHS = sum(RHS);
            
            LHS = num2str(LHS);
            app.LHSTextArea_2.Value = LHS;
            RHS = num2str(RHS);
            app.RHSTextArea_2.Value = RHS;
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 684 482];
            app.UIFigure.Name = 'UI Figure';

            % Create DiscreteTimeSignalsAnalyzerPanel
            app.DiscreteTimeSignalsAnalyzerPanel = uipanel(app.UIFigure);
            app.DiscreteTimeSignalsAnalyzerPanel.ForegroundColor = [0.4902 0.1804 0.5608];
            app.DiscreteTimeSignalsAnalyzerPanel.Title = 'Discrete-Time Signals Analyzer ';
            app.DiscreteTimeSignalsAnalyzerPanel.BackgroundColor = [0.302 0.749 0.9294];
            app.DiscreteTimeSignalsAnalyzerPanel.FontName = 'MS Reference Sans Serif';
            app.DiscreteTimeSignalsAnalyzerPanel.FontSize = 18;
            app.DiscreteTimeSignalsAnalyzerPanel.Position = [1 1 684 480];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.DiscreteTimeSignalsAnalyzerPanel);
            app.TabGroup.Position = [1 1 684 449];

            % Create IntroTab
            app.IntroTab = uitab(app.TabGroup);
            app.IntroTab.Title = 'Intro';

            % Create WELCOMELabel
            app.WELCOMELabel = uilabel(app.IntroTab);
            app.WELCOMELabel.HorizontalAlignment = 'center';
            app.WELCOMELabel.FontName = 'Adobe Garamond Pro Bold';
            app.WELCOMELabel.FontSize = 24;
            app.WELCOMELabel.FontWeight = 'bold';
            app.WELCOMELabel.FontAngle = 'italic';
            app.WELCOMELabel.FontColor = [0.6392 0.0784 0.1804];
            app.WELCOMELabel.Position = [221 363 239 62];
            app.WELCOMELabel.Text = 'WELCOME ';

            % Create INTROTextAreaLabel
            app.INTROTextAreaLabel = uilabel(app.IntroTab);
            app.INTROTextAreaLabel.HorizontalAlignment = 'right';
            app.INTROTextAreaLabel.FontName = 'Times New Roman';
            app.INTROTextAreaLabel.FontSize = 18;
            app.INTROTextAreaLabel.FontColor = [0.851 0.3294 0.102];
            app.INTROTextAreaLabel.Position = [18 340 60 22];
            app.INTROTextAreaLabel.Text = 'INTRO';

            % Create INTROTextArea
            app.INTROTextArea = uitextarea(app.IntroTab);
            app.INTROTextArea.FontName = 'Times New Roman';
            app.INTROTextArea.FontSize = 18;
            app.INTROTextArea.FontColor = [0.851 0.3294 0.102];
            app.INTROTextArea.Position = [93 263 556 101];
            app.INTROTextArea.Value = {'This is a simple GUI to aid in the understanding and analysis of Discrete-Time Signals and their properties.'; ''; '--Currently supports only 1 Input signal'; ''};

            % Create LOGTextAreaLabel
            app.LOGTextAreaLabel = uilabel(app.IntroTab);
            app.LOGTextAreaLabel.HorizontalAlignment = 'right';
            app.LOGTextAreaLabel.FontName = 'Times New Roman';
            app.LOGTextAreaLabel.FontSize = 14;
            app.LOGTextAreaLabel.Position = [35 152 38 22];
            app.LOGTextAreaLabel.Text = 'LOG:';

            % Create LOGTextArea
            app.LOGTextArea = uitextarea(app.IntroTab);
            app.LOGTextArea.FontName = 'Times New Roman';
            app.LOGTextArea.FontSize = 14;
            app.LOGTextArea.Position = [88 37 555 139];
            app.LOGTextArea.Value = {'Updates:'; ''; '--------------------------'; 'Built Mainframe GUI'; ''; '------------------------------ '; 'Completed the properties tab'; ''; '------------------------------'; ' Scrapped model. Built V1.2'; ''; '------------------------------'; ' Fixed Interface and added plot tab'; ''; '------------------------------'; 'Matlab does not support to non-real arithmetic.'; ''; '------------------------------'; ''; 'Symmetry property does not load as Matlab fails to load imaginary values'; ''; '------------------------------'; ''; 'Added More Properties'; ''; '------------------------------'; ''; 'Parsevals identity Bug pulled'; ''; '------------------------------'; ''};

            % Create Label
            app.Label = uilabel(app.IntroTab);
            app.Label.BackgroundColor = [0.9294 0.6902 0.1294];
            app.Label.HorizontalAlignment = 'center';
            app.Label.FontColor = [0 1 1];
            app.Label.Position = [0 1 683 22];
            app.Label.Text = '     <  Made by Enthusiastic Coders from the ML dept -RIT Bangalore >';

            % Create InputTab
            app.InputTab = uitab(app.TabGroup);
            app.InputTab.Title = 'Input';

            % Create EntertheSignalLabel
            app.EntertheSignalLabel = uilabel(app.InputTab);
            app.EntertheSignalLabel.FontName = 'Lucida Sans Unicode';
            app.EntertheSignalLabel.FontSize = 18;
            app.EntertheSignalLabel.Position = [66 359 153 31];
            app.EntertheSignalLabel.Text = 'Enter the Signal';

            % Create UIAxes
            app.UIAxes = uiaxes(app.InputTab);
            title(app.UIAxes, '2D Discrete Plot of input ')
            xlabel(app.UIAxes, 'Time')
            ylabel(app.UIAxes, 'Amplitudes')
            app.UIAxes.FontName = 'Arial Narrow';
            app.UIAxes.FontSize = 11;
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.Box = 'on';
            app.UIAxes.Color = [0.8 0.8 0.8];
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [258 114 352 286];

            % Create EnterthetimeseriesLabel
            app.EnterthetimeseriesLabel = uilabel(app.InputTab);
            app.EnterthetimeseriesLabel.HorizontalAlignment = 'right';
            app.EnterthetimeseriesLabel.Position = [83 308 115 22];
            app.EnterthetimeseriesLabel.Text = 'Enter the time series';

            % Create input1
            app.input1 = uieditfield(app.InputTab, 'text');
            app.input1.ValueChangedFcn = createCallbackFcn(app, @input1ValueChanged, true);
            app.input1.Position = [45 287 192 22];

            % Create EntertheAmplitudevaluesLabel
            app.EntertheAmplitudevaluesLabel = uilabel(app.InputTab);
            app.EntertheAmplitudevaluesLabel.HorizontalAlignment = 'right';
            app.EntertheAmplitudevaluesLabel.Position = [66 215 149 22];
            app.EntertheAmplitudevaluesLabel.Text = 'Enter the Amplitude values';

            % Create input2
            app.input2 = uieditfield(app.InputTab, 'text');
            app.input2.ValueChangedFcn = createCallbackFcn(app, @input2ValueChanged, true);
            app.input2.Position = [45 194 192 22];

            % Create plotting
            app.plotting = uibutton(app.InputTab, 'push');
            app.plotting.ButtonPushedFcn = createCallbackFcn(app, @plottingButtonPushed, true);
            app.plotting.Position = [98 135 100 22];
            app.plotting.Text = 'PLOT';

            % Create PropTab
            app.PropTab = uitab(app.TabGroup);
            app.PropTab.Title = 'Prop';

            % Create SelectthepropertyButtonGroup
            app.SelectthepropertyButtonGroup = uibuttongroup(app.PropTab);
            app.SelectthepropertyButtonGroup.TitlePosition = 'centertop';
            app.SelectthepropertyButtonGroup.Title = 'Select the property';
            app.SelectthepropertyButtonGroup.Position = [13 10 155 406];

            % Create TimeshiftingButton
            app.TimeshiftingButton = uibutton(app.SelectthepropertyButtonGroup, 'push');
            app.TimeshiftingButton.ButtonPushedFcn = createCallbackFcn(app, @TimeshiftingButtonPushed, true);
            app.TimeshiftingButton.Position = [28 335 100 22];
            app.TimeshiftingButton.Text = 'Time shifting';

            % Create FreqshiftingButton
            app.FreqshiftingButton = uibutton(app.SelectthepropertyButtonGroup, 'push');
            app.FreqshiftingButton.ButtonPushedFcn = createCallbackFcn(app, @FreqshiftingButtonPushed, true);
            app.FreqshiftingButton.Position = [28 243 100 22];
            app.FreqshiftingButton.Text = 'Freq shifting';

            % Create FoldingButton
            app.FoldingButton = uibutton(app.SelectthepropertyButtonGroup, 'push');
            app.FoldingButton.ButtonPushedFcn = createCallbackFcn(app, @FoldingButtonPushed, true);
            app.FoldingButton.Position = [28 154 100 22];
            app.FoldingButton.Text = 'Folding';

            % Create SymmetryButton
            app.SymmetryButton = uibutton(app.SelectthepropertyButtonGroup, 'push');
            app.SymmetryButton.ButtonPushedFcn = createCallbackFcn(app, @SymmetryButtonPushed, true);
            app.SymmetryButton.Position = [28 50 100 22];
            app.SymmetryButton.Text = 'Symmetry';

            % Create InputSignalLabel
            app.InputSignalLabel = uilabel(app.PropTab);
            app.InputSignalLabel.FontSize = 16;
            app.InputSignalLabel.FontWeight = 'bold';
            app.InputSignalLabel.Position = [212 385 97 22];
            app.InputSignalLabel.Text = 'Input Signal';

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.PropTab);
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.Position = [320 300 25 22];
            app.XEditFieldLabel.Text = 'X:';

            % Create Xinput
            app.Xinput = uieditfield(app.PropTab, 'text');
            app.Xinput.Editable = 'off';
            app.Xinput.Position = [360 300 100 22];

            % Create Label_2
            app.Label_2 = uilabel(app.PropTab);
            app.Label_2.FontSize = 16;
            app.Label_2.Position = [215 200 374 81];
            app.Label_2.Text = '';

            % Create EnterShiftEditFieldLabel
            app.EnterShiftEditFieldLabel = uilabel(app.PropTab);
            app.EnterShiftEditFieldLabel.HorizontalAlignment = 'right';
            app.EnterShiftEditFieldLabel.Position = [253 164 62 22];
            app.EnterShiftEditFieldLabel.Text = 'Enter Shift';

            % Create EnterShift
            app.EnterShift = uieditfield(app.PropTab, 'text');
            app.EnterShift.FontSize = 14;
            app.EnterShift.Position = [330 164 100 22];

            % Create ShiftButton
            app.ShiftButton = uibutton(app.PropTab, 'push');
            app.ShiftButton.ButtonPushedFcn = createCallbackFcn(app, @ShiftButtonPushed, true);
            app.ShiftButton.Position = [461 164 100 22];
            app.ShiftButton.Text = 'Shift';

            % Create AnswerLabel
            app.AnswerLabel = uilabel(app.PropTab);
            app.AnswerLabel.HorizontalAlignment = 'center';
            app.AnswerLabel.FontWeight = 'bold';
            app.AnswerLabel.Position = [349 112 122 27];
            app.AnswerLabel.Text = 'Answer';

            % Create outLHS
            app.outLHS = uitextarea(app.PropTab);
            app.outLHS.Position = [206 43 407 57];

            % Create ShiftButton2
            app.ShiftButton2 = uibutton(app.PropTab, 'push');
            app.ShiftButton2.ButtonPushedFcn = createCallbackFcn(app, @ShiftButton2Pushed, true);
            app.ShiftButton2.Position = [461 164 100 22];
            app.ShiftButton2.Text = 'Shift';

            % Create EntercommaseparatedInputLabel
            app.EntercommaseparatedInputLabel = uilabel(app.PropTab);
            app.EntercommaseparatedInputLabel.HorizontalAlignment = 'center';
            app.EntercommaseparatedInputLabel.FontSize = 11;
            app.EntercommaseparatedInputLabel.FontWeight = 'bold';
            app.EntercommaseparatedInputLabel.Position = [280 334 243 22];
            app.EntercommaseparatedInputLabel.Text = 'Enter comma separated Input';

            % Create ShiftButton3
            app.ShiftButton3 = uibutton(app.PropTab, 'push');
            app.ShiftButton3.ButtonPushedFcn = createCallbackFcn(app, @ShiftButton3Pushed, true);
            app.ShiftButton3.Position = [459 164 100 22];
            app.ShiftButton3.Text = 'Shift';

            % Create ShiftButton4
            app.ShiftButton4 = uibutton(app.PropTab, 'push');
            app.ShiftButton4.ButtonPushedFcn = createCallbackFcn(app, @ShiftButton4Pushed, true);
            app.ShiftButton4.Position = [459 164 100 22];
            app.ShiftButton4.Text = 'Shift';

            % Create MorePropTab
            app.MorePropTab = uitab(app.TabGroup);
            app.MorePropTab.Title = 'More Prop';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.MorePropTab);
            app.TabGroup2.Position = [1 -1 684 426];

            % Create MultiplicationinTimeTab
            app.MultiplicationinTimeTab = uitab(app.TabGroup2);
            app.MultiplicationinTimeTab.Title = 'Multiplication in Time';

            % Create MultiplicationinTimeisgivenbytheequationLabel
            app.MultiplicationinTimeisgivenbytheequationLabel = uilabel(app.MultiplicationinTimeTab);
            app.MultiplicationinTimeisgivenbytheequationLabel.FontName = 'Arial';
            app.MultiplicationinTimeisgivenbytheequationLabel.FontSize = 16;
            app.MultiplicationinTimeisgivenbytheequationLabel.FontWeight = 'bold';
            app.MultiplicationinTimeisgivenbytheequationLabel.Position = [158 349 367 37];
            app.MultiplicationinTimeisgivenbytheequationLabel.Text = 'Multiplication in Time is given by the equation:';

            % Create TextArea3
            app.TextArea3 = uitextarea(app.MultiplicationinTimeTab);
            app.TextArea3.Editable = 'off';
            app.TextArea3.HorizontalAlignment = 'center';
            app.TextArea3.Position = [49 305 582 32];
            app.TextArea3.Value = {'DFT{ x1(n) * x2(n)} = 1/N * (X1(k) ** X2(k))   ** - Convolution'; ''};

            % Create ComputeButton
            app.ComputeButton = uibutton(app.MultiplicationinTimeTab, 'push');
            app.ComputeButton.ButtonPushedFcn = createCallbackFcn(app, @ComputeButtonPushed, true);
            app.ComputeButton.BackgroundColor = [0.651 0.651 0.651];
            app.ComputeButton.FontWeight = 'bold';
            app.ComputeButton.Position = [267 126 143 49];
            app.ComputeButton.Text = 'Compute';

            % Create EntercommaseparatedvaluesLabel
            app.EntercommaseparatedvaluesLabel = uilabel(app.MultiplicationinTimeTab);
            app.EntercommaseparatedvaluesLabel.FontWeight = 'bold';
            app.EntercommaseparatedvaluesLabel.Position = [49 262 182 22];
            app.EntercommaseparatedvaluesLabel.Text = 'Enter comma separated values';

            % Create LHSTextAreaLabel
            app.LHSTextAreaLabel = uilabel(app.MultiplicationinTimeTab);
            app.LHSTextAreaLabel.HorizontalAlignment = 'right';
            app.LHSTextAreaLabel.Position = [69 69 29 22];
            app.LHSTextAreaLabel.Text = 'LHS';

            % Create LHSTextArea
            app.LHSTextArea = uitextarea(app.MultiplicationinTimeTab);
            app.LHSTextArea.Position = [113 64 150 29];

            % Create RHSTextAreaLabel
            app.RHSTextAreaLabel = uilabel(app.MultiplicationinTimeTab);
            app.RHSTextAreaLabel.HorizontalAlignment = 'right';
            app.RHSTextAreaLabel.Position = [404 67 31 22];
            app.RHSTextAreaLabel.Text = 'RHS';

            % Create RHSTextArea
            app.RHSTextArea = uitextarea(app.MultiplicationinTimeTab);
            app.RHSTextArea.Position = [450 64 150 27];

            % Create Label_3
            app.Label_3 = uilabel(app.MultiplicationinTimeTab);
            app.Label_3.Position = [267 18 150 22];
            app.Label_3.Text = '';

            % Create Input1EditFieldLabel
            app.Input1EditFieldLabel = uilabel(app.MultiplicationinTimeTab);
            app.Input1EditFieldLabel.HorizontalAlignment = 'right';
            app.Input1EditFieldLabel.Position = [74 214 42 22];
            app.Input1EditFieldLabel.Text = 'Input 1';

            % Create Input1EditField
            app.Input1EditField = uieditfield(app.MultiplicationinTimeTab, 'text');
            app.Input1EditField.Position = [131 214 100 22];

            % Create Input2EditFieldLabel
            app.Input2EditFieldLabel = uilabel(app.MultiplicationinTimeTab);
            app.Input2EditFieldLabel.HorizontalAlignment = 'right';
            app.Input2EditFieldLabel.Position = [434 214 42 22];
            app.Input2EditFieldLabel.Text = 'Input 2';

            % Create Input2EditField
            app.Input2EditField = uieditfield(app.MultiplicationinTimeTab, 'text');
            app.Input2EditField.Position = [491 214 100 22];

            % Create ConvolutionTab
            app.ConvolutionTab = uitab(app.TabGroup2);
            app.ConvolutionTab.Title = 'Convolution';

            % Create ConvolutionusingStockhamsMethodLabel
            app.ConvolutionusingStockhamsMethodLabel = uilabel(app.ConvolutionTab);
            app.ConvolutionusingStockhamsMethodLabel.HorizontalAlignment = 'center';
            app.ConvolutionusingStockhamsMethodLabel.FontName = 'Arial';
            app.ConvolutionusingStockhamsMethodLabel.FontSize = 16;
            app.ConvolutionusingStockhamsMethodLabel.FontWeight = 'bold';
            app.ConvolutionusingStockhamsMethodLabel.Position = [96 359 485 22];
            app.ConvolutionusingStockhamsMethodLabel.Text = 'Convolution using Stockhams Method';

            % Create FormulaTextAreaLabel
            app.FormulaTextAreaLabel = uilabel(app.ConvolutionTab);
            app.FormulaTextAreaLabel.HorizontalAlignment = 'right';
            app.FormulaTextAreaLabel.FontName = 'Arial';
            app.FormulaTextAreaLabel.FontWeight = 'bold';
            app.FormulaTextAreaLabel.Position = [73 311 57 22];
            app.FormulaTextAreaLabel.Text = 'Formula:';

            % Create FormulaTextArea
            app.FormulaTextArea = uitextarea(app.ConvolutionTab);
            app.FormulaTextArea.FontName = 'Arial';
            app.FormulaTextArea.Position = [145 257 463 78];
            app.FormulaTextArea.Value = {'According to Stockham''s Method  Convolution of two sequences x1(n) and x2(n) is given by:'; ''; 'Y(k) = DFT(x1(n)) * DFT(x2(n))'; 'y(n) = IDFT(Y(k))'};

            % Create EntercommaseparatedvaluesLabel_2
            app.EntercommaseparatedvaluesLabel_2 = uilabel(app.ConvolutionTab);
            app.EntercommaseparatedvaluesLabel_2.FontWeight = 'bold';
            app.EntercommaseparatedvaluesLabel_2.Position = [153 214 182 22];
            app.EntercommaseparatedvaluesLabel_2.Text = 'Enter comma separated values';

            % Create CalculateButton
            app.CalculateButton = uibutton(app.ConvolutionTab, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.BackgroundColor = [0.502 0.502 0.502];
            app.CalculateButton.Position = [292 105 148 39];
            app.CalculateButton.Text = 'Calculate';

            % Create AnswerTextAreaLabel
            app.AnswerTextAreaLabel = uilabel(app.ConvolutionTab);
            app.AnswerTextAreaLabel.HorizontalAlignment = 'right';
            app.AnswerTextAreaLabel.Position = [221 40 46 22];
            app.AnswerTextAreaLabel.Text = 'Answer';

            % Create AnswerTextArea
            app.AnswerTextArea = uitextarea(app.ConvolutionTab);
            app.AnswerTextArea.Position = [282 40 181 22];

            % Create Input1EditField_2Label
            app.Input1EditField_2Label = uilabel(app.ConvolutionTab);
            app.Input1EditField_2Label.HorizontalAlignment = 'right';
            app.Input1EditField_2Label.Position = [149 172 42 22];
            app.Input1EditField_2Label.Text = 'Input 1';

            % Create Input1EditField_2
            app.Input1EditField_2 = uieditfield(app.ConvolutionTab, 'text');
            app.Input1EditField_2.Position = [206 172 132 22];

            % Create Input2Label
            app.Input2Label = uilabel(app.ConvolutionTab);
            app.Input2Label.HorizontalAlignment = 'right';
            app.Input2Label.Position = [416 172 42 22];
            app.Input2Label.Text = 'Input 2';

            % Create Input2EditField_2
            app.Input2EditField_2 = uieditfield(app.ConvolutionTab, 'text');
            app.Input2EditField_2.Position = [473 172 135 22];

            % Create ParsevalsIdentityTab
            app.ParsevalsIdentityTab = uitab(app.TabGroup2);
            app.ParsevalsIdentityTab.Title = 'Parsevals Identity';

            % Create ParsevalsIdentityLabel
            app.ParsevalsIdentityLabel = uilabel(app.ParsevalsIdentityTab);
            app.ParsevalsIdentityLabel.HorizontalAlignment = 'center';
            app.ParsevalsIdentityLabel.FontSize = 16;
            app.ParsevalsIdentityLabel.FontWeight = 'bold';
            app.ParsevalsIdentityLabel.Position = [197 360 289 22];
            app.ParsevalsIdentityLabel.Text = 'Parseval''s Identity ';

            % Create FormulaTextArea_2Label
            app.FormulaTextArea_2Label = uilabel(app.ParsevalsIdentityTab);
            app.FormulaTextArea_2Label.HorizontalAlignment = 'right';
            app.FormulaTextArea_2Label.FontWeight = 'bold';
            app.FormulaTextArea_2Label.Position = [86 315 57 22];
            app.FormulaTextArea_2Label.Text = 'Formula:';

            % Create FormulaTextArea_2
            app.FormulaTextArea_2 = uitextarea(app.ParsevalsIdentityTab);
            app.FormulaTextArea_2.Position = [158 284 441 55];
            app.FormulaTextArea_2.Value = {'Parseval''s Identity is given by: '; ''; 'sum(x''(n)*y(n)) = 1/N*sum(DFT(x''(n))*DFT(y(n))   ---(sum over 0 to N-1)'; ''};

            % Create Input1TextAreaLabel
            app.Input1TextAreaLabel = uilabel(app.ParsevalsIdentityTab);
            app.Input1TextAreaLabel.HorizontalAlignment = 'right';
            app.Input1TextAreaLabel.Position = [138 189 42 22];
            app.Input1TextAreaLabel.Text = 'Input 1';

            % Create Input1TextArea
            app.Input1TextArea = uitextarea(app.ParsevalsIdentityTab);
            app.Input1TextArea.Position = [195 188 150 25];

            % Create Input2TextAreaLabel
            app.Input2TextAreaLabel = uilabel(app.ParsevalsIdentityTab);
            app.Input2TextAreaLabel.HorizontalAlignment = 'right';
            app.Input2TextAreaLabel.Position = [375 188 46 22];
            app.Input2TextAreaLabel.Text = 'Input  2';

            % Create Input2TextArea
            app.Input2TextArea = uitextarea(app.ParsevalsIdentityTab);
            app.Input2TextArea.Position = [436 188 150 24];

            % Create EntercommaseparatedvaluesLabel_3
            app.EntercommaseparatedvaluesLabel_3 = uilabel(app.ParsevalsIdentityTab);
            app.EntercommaseparatedvaluesLabel_3.FontWeight = 'bold';
            app.EntercommaseparatedvaluesLabel_3.Position = [179 229 182 22];
            app.EntercommaseparatedvaluesLabel_3.Text = 'Enter comma separated values';

            % Create VerifyButton
            app.VerifyButton = uibutton(app.ParsevalsIdentityTab, 'push');
            app.VerifyButton.ButtonPushedFcn = createCallbackFcn(app, @VerifyButtonPushed, true);
            app.VerifyButton.BackgroundColor = [0.651 0.651 0.651];
            app.VerifyButton.Position = [290 109 131 50];
            app.VerifyButton.Text = 'Verify';

            % Create LHSTextArea_2Label
            app.LHSTextArea_2Label = uilabel(app.ParsevalsIdentityTab);
            app.LHSTextArea_2Label.HorizontalAlignment = 'right';
            app.LHSTextArea_2Label.Position = [145 62 29 22];
            app.LHSTextArea_2Label.Text = 'LHS';

            % Create LHSTextArea_2
            app.LHSTextArea_2 = uitextarea(app.ParsevalsIdentityTab);
            app.LHSTextArea_2.Position = [189 62 150 24];

            % Create RHSTextArea_2Label
            app.RHSTextArea_2Label = uilabel(app.ParsevalsIdentityTab);
            app.RHSTextArea_2Label.HorizontalAlignment = 'right';
            app.RHSTextArea_2Label.Position = [390 62 31 22];
            app.RHSTextArea_2Label.Text = 'RHS';

            % Create RHSTextArea_2
            app.RHSTextArea_2 = uitextarea(app.ParsevalsIdentityTab);
            app.RHSTextArea_2.Position = [436 62 150 24];

            % Create SupportTab
            app.SupportTab = uitab(app.TabGroup);
            app.SupportTab.Title = 'Support';
            app.SupportTab.BackgroundColor = [1 1 1];

            % Create LICENSETextArea
            app.LICENSETextArea = uitextarea(app.SupportTab);
            app.LICENSETextArea.HorizontalAlignment = 'center';
            app.LICENSETextArea.FontName = 'Arial';
            app.LICENSETextArea.FontWeight = 'bold';
            app.LICENSETextArea.FontColor = [0 0.451 0.7412];
            app.LICENSETextArea.Position = [15 138 651 254];
            app.LICENSETextArea.Value = {'Permission '; ''; 'MIT License'; ''; 'Copyright (c) 2018 Adway Kanhere'; ''; 'Permission is hereby granted, free of charge, to any person obtaining a copy'; 'of this software and associated documentation files (the "Software"), to deal'; 'in the Software without restriction, including without limitation the rights'; 'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell'; 'copies of the Software, and to permit persons to whom the Software is'; 'furnished to do so, subject to the following conditions:'; ''; 'The above copyright notice and this permission notice shall be included in all'; 'copies or substantial portions of the Software.'; ''; 'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR'; 'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,'; 'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE'; 'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER'; 'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,'; 'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE'; 'SOFTWARE.'; ''};

            % Create CODETextAreaLabel
            app.CODETextAreaLabel = uilabel(app.SupportTab);
            app.CODETextAreaLabel.HorizontalAlignment = 'right';
            app.CODETextAreaLabel.FontName = 'Arial';
            app.CODETextAreaLabel.FontSize = 18;
            app.CODETextAreaLabel.FontWeight = 'bold';
            app.CODETextAreaLabel.FontColor = [0 0.451 0.7412];
            app.CODETextAreaLabel.Position = [35 59 67 41];
            app.CODETextAreaLabel.Text = 'CODE';

            % Create CODETextArea
            app.CODETextArea = uitextarea(app.SupportTab);
            app.CODETextArea.HorizontalAlignment = 'center';
            app.CODETextArea.FontName = 'Arial';
            app.CODETextArea.FontSize = 14;
            app.CODETextArea.FontAngle = 'italic';
            app.CODETextArea.FontColor = [0 0.451 0.7412];
            app.CODETextArea.Position = [147 40 519 60];
            app.CODETextArea.Value = {'Check out the full code at'; ''; 'www.github.com/YngYoda/DSPGui_Beta'; ''; 'Pull Requests Accepted'; ''};
        end
    end

    methods (Access = public)

        % Construct app
        function app = dsptrial

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end